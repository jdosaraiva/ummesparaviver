package net.ibmemorial.ummes.client;

import com.google.gwt.i18n.client.Messages;

public abstract interface ErrorMessages
  extends Messages
{
  public abstract String validateRequired(String paramString);
  
  public abstract String validateMinLength(String paramString, int paramInt);
  
  public abstract String validateMaxLength(String paramString, int paramInt);
  
  public abstract String validateCEP(String paramString);
  
  public abstract String validateTelefone(String paramString);
  
  public abstract String validateEmail(String paramString);
  
  public abstract String validateInteger(String paramString);
}
