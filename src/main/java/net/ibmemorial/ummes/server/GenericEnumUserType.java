package net.ibmemorial.ummes.server;

import java.io.Serializable;
import java.lang.reflect.Method;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import org.hibernate.HibernateException;
import org.hibernate.type.NullableType;
import org.hibernate.type.TypeFactory;
import org.hibernate.usertype.ParameterizedType;
import org.hibernate.usertype.UserType;

public class GenericEnumUserType implements UserType, ParameterizedType {
	private static final String DEFAULT_IDENTIFIER_METHOD_NAME = "name";
	private static final String DEFAULT_VALUE_OF_METHOD_NAME = "valueOf";
	private Class<?> enumClass;
	private Class<?> identifierType;
	private Method identifierMethod;
	private Method valueOfMethod;
	private NullableType type;
	private int[] sqlTypes;

	public void setParameterValues(Properties parameters) {
		String enumClassName = parameters.getProperty("enumClassName");
		try {
			this.enumClass = Class.forName(enumClassName).asSubclass(Enum.class);
		} catch (ClassNotFoundException cfne) {
			throw new HibernateException("Enum class not found", cfne);
		}

		String identifierMethodName = parameters.getProperty("identifierMethod", "name");
		try {
			this.identifierMethod = this.enumClass.getMethod(identifierMethodName, new Class[0]);
			this.identifierType = this.identifierMethod.getReturnType();
		} catch (Exception e) {
			throw new HibernateException("Failed to obtain identifier method", e);
		}

		this.type = ((NullableType) TypeFactory.basic(this.identifierType.getName()));

		if (this.type == null) {
			throw new HibernateException("Unsupported identifier type " + this.identifierType.getName());
		}
		this.sqlTypes = new int[] { this.type.sqlType() };

		String valueOfMethodName = parameters.getProperty("valueOfMethod", "valueOf");
		try {
			this.valueOfMethod = this.enumClass.getMethod(valueOfMethodName, new Class[] { this.identifierType });
		} catch (Exception e) {
			throw new HibernateException("Failed to obtain valueOf method", e);
		}
	}

	public Class<?> returnedClass() {
		return this.enumClass;
	}

	public Object nullSafeGet(ResultSet rs, String[] names, Object owner) throws HibernateException, SQLException {
		Object identifier = this.type.get(rs, names[0]);
		if (rs.wasNull()) {
			return null;
		}
		try {
			return this.valueOfMethod.invoke(this.enumClass, new Object[] { identifier });
		} catch (Exception e) {
			throw new HibernateException("Exception while invoking valueOf method " + this.valueOfMethod.getName()
					+ " of " + "enumeration class " + this.enumClass, e);
		}
	}

	public void nullSafeSet(PreparedStatement st, Object value, int index) throws HibernateException, SQLException {
		try {
			if (value == null) {
				st.setNull(index, this.type.sqlType());
			} else {
				Object identifier = this.identifierMethod.invoke(value, new Object[0]);
				this.type.set(st, identifier, index);
			}
		} catch (Exception e) {
			throw new HibernateException("Exception while invoking " + this.identifierMethod + " "
					+ this.identifierMethod.getName() + " of " + "enumeration class " + this.enumClass, e);
		}
	}

	public int[] sqlTypes() {
		return this.sqlTypes;
	}

	public Object assemble(Serializable cached, Object owner) throws HibernateException {
		return cached;
	}

	public Object deepCopy(Object value) throws HibernateException {
		return value;
	}

	public Serializable disassemble(Object value) throws HibernateException {
		return (Serializable) value;
	}

	public boolean equals(Object x, Object y) throws HibernateException {
		return x == y;
	}

	public int hashCode(Object x) throws HibernateException {
		return x.hashCode();
	}

	public boolean isMutable() {
		return false;
	}

	public Object replace(Object original, Object target, Object owner) throws HibernateException {
		return original;
	}
}
