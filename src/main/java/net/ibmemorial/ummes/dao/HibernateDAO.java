package net.ibmemorial.ummes.dao;

import java.io.Serializable;

public class HibernateDAO extends org.springframework.orm.hibernate3.support.HibernateDaoSupport
{
  public Serializable save(Object obj)
  {
    return getHibernateTemplate().save(obj);
  }
}
