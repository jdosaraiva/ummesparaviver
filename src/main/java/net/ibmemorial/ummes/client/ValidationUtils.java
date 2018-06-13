package net.ibmemorial.ummes.client;

import com.google.gwt.core.client.GWT;
import com.google.gwt.user.client.ui.CheckBox;
import com.google.gwt.user.client.ui.TextBoxBase;
import java.util.List;

public class ValidationUtils
{
  private static final ErrorMessages errors = (ErrorMessages)GWT.create(ErrorMessages.class);
  
  public static boolean isEmpty(String valor) {
    return (valor == null) || (valor.trim().length() == 0);
  }
  
  public static boolean isInteger(String valor) {
    if (isEmpty(valor)) {
      return false;
    }
    try
    {
      Integer.parseInt(valor);
      return true;
    } catch (NumberFormatException e) {}
    return false;
  }
  
  private static boolean returnValidateResult(boolean result, TextBoxBase tb)
  {
    if (result) {
      tb.removeStyleName("TextBox-error");
    } else {
      tb.addStyleName("TextBox-error");
    }
    
    return result;
  }
  
  private static boolean returnValidateResult(boolean result, CheckBox... cbs) { CheckBox[] arrayOfCheckBox;
    int j = (arrayOfCheckBox = cbs).length; for (int i = 0; i < j; i++) { CheckBox checkbox = arrayOfCheckBox[i];
      if (result) {
        checkbox.removeStyleName("CheckBox-error");
      } else {
        checkbox.addStyleName("CheckBox-error");
      }
    }
    
    return result;
  }
  
  public static boolean validateRequired(List<String> mensagens, String nomeCampo, TextBoxBase tb) {
    if (!isEmpty(tb.getText())) {
      return returnValidateResult(true, tb);
    }
    
    mensagens.add(errors.validateRequired(nomeCampo));
    return returnValidateResult(false, tb);
  }
  
  public static boolean validateOneRequired(List<String> mensagens, String nomeCampo, TextBoxBase... tb) {
    boolean result = false;
    TextBoxBase[] arrayOfTextBoxBase;
    int j = (arrayOfTextBoxBase = tb).length; for (int i = 0; i < j; i++) { TextBoxBase textBoxBase = arrayOfTextBoxBase[i];
      if (!isEmpty(textBoxBase.getText())) {
        result |= returnValidateResult(true, textBoxBase);
      }
    }
    
    if (result) {
      return true;
    }
    
    mensagens.add(errors.validateRequired(nomeCampo));
    
    j = (arrayOfTextBoxBase = tb).length; for (int i = 0; i < j; i++) { TextBoxBase textBoxBase = arrayOfTextBoxBase[i];
      result &= returnValidateResult(false, textBoxBase);
    }
    
    return false;
  }
  
  public static boolean validateInteger(List<String> mensagens, String nomeCampo, TextBoxBase tb) {
    if (isEmpty(tb.getText())) {
      return returnValidateResult(true, tb);
    }
    try
    {
      return returnValidateResult(true, tb);
    } catch (NumberFormatException e) {
      mensagens.add(errors.validateInteger(nomeCampo)); }
    return returnValidateResult(false, tb);
  }
  
  public static boolean validateRequired(List<String> mensagens, String nomeCampo, CheckBox... cbs)
  {
    boolean checked = false;
    CheckBox[] arrayOfCheckBox;
    int j = (arrayOfCheckBox = cbs).length; for (int i = 0; i < j; i++) { CheckBox checkBox = arrayOfCheckBox[i];
      checked |= checkBox.getValue().booleanValue();
    }
    
    if (!checked) {
      mensagens.add(errors.validateRequired(nomeCampo));
    }
    
    return returnValidateResult(checked, cbs);
  }
  
  public static boolean validateMinLength(List<String> mensagens, String nomeCampo, TextBoxBase tb, int minLength) {
    if ((isEmpty(tb.getText())) || (tb.getText().trim().length() >= minLength)) {
      return returnValidateResult(true, tb);
    }
    
    mensagens.add(errors.validateMinLength(nomeCampo, minLength));
    
    return returnValidateResult(false, tb);
  }
  
  public static boolean validateMaxLength(List<String> mensagens, String nomeCampo, TextBoxBase tb, int maxLength) {
    if ((isEmpty(tb.getText())) || (tb.getText().trim().length() <= maxLength)) {
      return returnValidateResult(true, tb);
    }
    
    mensagens.add(errors.validateMaxLength(nomeCampo, maxLength));
    return returnValidateResult(false, tb);
  }
  
  public static boolean validateCEP(List<String> mensagens, String nomeCampo, TextBoxBase tb) {
    if ((isEmpty(tb.getText())) || (tb.getText().trim().matches("[0-9]{5}\\-[0-9]{3}"))) {
      return returnValidateResult(true, tb);
    }
    
    mensagens.add(errors.validateCEP(nomeCampo));
    return returnValidateResult(false, tb);
  }
  
  public static boolean validateTelefone(List<String> mensagens, String nomeCampo, TextBoxBase tb) {
    if ((isEmpty(tb.getText())) || (tb.getText().trim().matches("\\([0-9]{2}\\)[0-9]{4}\\-[0-9]{4}"))) {
      return returnValidateResult(true, tb);
    }
    
    mensagens.add(errors.validateTelefone(nomeCampo));
    return returnValidateResult(false, tb);
  }
  
  public static boolean validateEmail(List<String> mensagens, String nomeCampo, TextBoxBase tb) {
    if ((isEmpty(tb.getText())) || (tb.getText().trim().matches(".+@.+\\.[a-z]+"))) {
      return returnValidateResult(true, tb);
    }
    
    mensagens.add(errors.validateEmail(nomeCampo));
    return returnValidateResult(false, tb);
  }
}
