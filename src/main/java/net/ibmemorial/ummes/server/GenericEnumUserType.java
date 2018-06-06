/*     */ package net.ibmemorial.ummes.server;
/*     */ 
/*     */ import java.io.Serializable;
/*     */ import java.lang.reflect.Method;
/*     */ import java.sql.PreparedStatement;
/*     */ import java.sql.ResultSet;
/*     */ import java.sql.SQLException;
/*     */ import java.util.Properties;
/*     */ import org.hibernate.HibernateException;
/*     */ import org.hibernate.type.NullableType;
/*     */ import org.hibernate.type.TypeFactory;
/*     */ import org.hibernate.usertype.ParameterizedType;
/*     */ import org.hibernate.usertype.UserType;
/*     */ 
/*     */ public class GenericEnumUserType implements UserType, ParameterizedType
/*     */ {
/*     */   private static final String DEFAULT_IDENTIFIER_METHOD_NAME = "name";
/*     */   private static final String DEFAULT_VALUE_OF_METHOD_NAME = "valueOf";
/*     */   private Class<?> enumClass;
/*     */   private Class<?> identifierType;
/*     */   private Method identifierMethod;
/*     */   private Method valueOfMethod;
/*     */   private NullableType type;
/*     */   private int[] sqlTypes;
/*     */   
/*     */   public void setParameterValues(Properties parameters)
/*     */   {
/*  28 */     String enumClassName = parameters.getProperty("enumClassName");
/*     */     try {
/*  30 */       this.enumClass = Class.forName(enumClassName).asSubclass(Enum.class);
/*     */     } catch (ClassNotFoundException cfne) {
/*  32 */       throw new HibernateException("Enum class not found", cfne);
/*     */     }
/*     */     
/*  35 */     String identifierMethodName = parameters.getProperty("identifierMethod", "name");
/*     */     try
/*     */     {
/*  38 */       this.identifierMethod = this.enumClass.getMethod(identifierMethodName, new Class[0]);
/*  39 */       this.identifierType = this.identifierMethod.getReturnType();
/*     */     } catch (Exception e) {
/*  41 */       throw new HibernateException("Failed to obtain identifier method", e);
/*     */     }
/*     */     
/*  44 */     this.type = ((NullableType)TypeFactory.basic(this.identifierType.getName()));
/*     */     
/*  46 */     if (this.type == null) {
/*  47 */       throw new HibernateException("Unsupported identifier type " + this.identifierType.getName());
/*     */     }
/*  49 */     this.sqlTypes = new int[] { this.type.sqlType() };
/*     */     
/*  51 */     String valueOfMethodName = parameters.getProperty("valueOfMethod", "valueOf");
/*     */     try
/*     */     {
/*  54 */       this.valueOfMethod = this.enumClass.getMethod(valueOfMethodName, new Class[] { this.identifierType });
/*     */     } catch (Exception e) {
/*  56 */       throw new HibernateException("Failed to obtain valueOf method", e);
/*     */     }
/*     */   }
/*     */   
/*     */   public Class<?> returnedClass() {
/*  61 */     return this.enumClass;
/*     */   }
/*     */   
/*     */   public Object nullSafeGet(ResultSet rs, String[] names, Object owner) throws HibernateException, SQLException
/*     */   {
/*  66 */     Object identifier = this.type.get(rs, names[0]);
/*  67 */     if (rs.wasNull()) {
/*  68 */       return null;
/*     */     }
/*     */     try
/*     */     {
/*  72 */       return this.valueOfMethod.invoke(this.enumClass, new Object[] { identifier });
/*     */     } catch (Exception e) {
/*  74 */       throw new HibernateException("Exception while invoking valueOf method " + 
/*  75 */         this.valueOfMethod.getName() + " of " + "enumeration class " + this.enumClass, e);
/*     */     }
/*     */   }
/*     */   
/*     */   public void nullSafeSet(PreparedStatement st, Object value, int index) throws HibernateException, SQLException
/*     */   {
/*     */     try {
/*  82 */       if (value == null) {
/*  83 */         st.setNull(index, this.type.sqlType());
/*     */       } else {
/*  85 */         Object identifier = this.identifierMethod.invoke(value, new Object[0]);
/*  86 */         this.type.set(st, identifier, index);
/*     */       }
/*     */     } catch (Exception e) {
/*  89 */       throw new HibernateException("Exception while invoking " + this.identifierMethod + " " + 
/*  90 */         this.identifierMethod.getName() + " of " + "enumeration class " + this.enumClass, e);
/*     */     }
/*     */   }
/*     */   
/*     */   public int[] sqlTypes() {
/*  95 */     return this.sqlTypes;
/*     */   }
/*     */   
/*     */   public Object assemble(Serializable cached, Object owner) throws HibernateException {
/*  99 */     return cached;
/*     */   }
/*     */   
/*     */   public Object deepCopy(Object value) throws HibernateException {
/* 103 */     return value;
/*     */   }
/*     */   
/*     */   public Serializable disassemble(Object value) throws HibernateException {
/* 107 */     return (Serializable)value;
/*     */   }
/*     */   
/*     */   public boolean equals(Object x, Object y) throws HibernateException {
/* 111 */     return x == y;
/*     */   }
/*     */   
/*     */   public int hashCode(Object x) throws HibernateException {
/* 115 */     return x.hashCode();
/*     */   }
/*     */   
/*     */   public boolean isMutable() {
/* 119 */     return false;
/*     */   }
/*     */   
/*     */   public Object replace(Object original, Object target, Object owner) throws HibernateException {
/* 123 */     return original;
/*     */   }
/*     */ }
