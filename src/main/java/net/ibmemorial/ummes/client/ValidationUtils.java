/*     */ package net.ibmemorial.ummes.client;
/*     */ 
/*     */ import com.google.gwt.core.client.GWT;
/*     */ import com.google.gwt.user.client.ui.CheckBox;
/*     */ import com.google.gwt.user.client.ui.TextBoxBase;
/*     */ import java.util.List;
/*     */ 
/*     */ public class ValidationUtils
/*     */ {
/*  10 */   private static final ErrorMessages errors = (ErrorMessages)GWT.create(ErrorMessages.class);
/*     */   
/*     */   public static boolean isEmpty(String valor) {
/*  13 */     return (valor == null) || (valor.trim().length() == 0);
/*     */   }
/*     */   
/*     */   public static boolean isInteger(String valor) {
/*  17 */     if (isEmpty(valor)) {
/*  18 */       return false;
/*     */     }
/*     */     try
/*     */     {
/*  22 */       Integer.parseInt(valor);
/*  23 */       return true;
/*     */     } catch (NumberFormatException e) {}
/*  25 */     return false;
/*     */   }
/*     */   
/*     */   private static boolean returnValidateResult(boolean result, TextBoxBase tb)
/*     */   {
/*  30 */     if (result) {
/*  31 */       tb.removeStyleName("TextBox-error");
/*     */     } else {
/*  33 */       tb.addStyleName("TextBox-error");
/*     */     }
/*     */     
/*  36 */     return result;
/*     */   }
/*     */   
/*     */   private static boolean returnValidateResult(boolean result, CheckBox... cbs) { CheckBox[] arrayOfCheckBox;
/*  40 */     int j = (arrayOfCheckBox = cbs).length; for (int i = 0; i < j; i++) { CheckBox checkbox = arrayOfCheckBox[i];
/*  41 */       if (result) {
/*  42 */         checkbox.removeStyleName("CheckBox-error");
/*     */       } else {
/*  44 */         checkbox.addStyleName("CheckBox-error");
/*     */       }
/*     */     }
/*     */     
/*  48 */     return result;
/*     */   }
/*     */   
/*     */   public static boolean validateRequired(List<String> mensagens, String nomeCampo, TextBoxBase tb) {
/*  52 */     if (!isEmpty(tb.getText())) {
/*  53 */       return returnValidateResult(true, tb);
/*     */     }
/*     */     
/*  56 */     mensagens.add(errors.validateRequired(nomeCampo));
/*  57 */     return returnValidateResult(false, tb);
/*     */   }
/*     */   
/*     */   public static boolean validateOneRequired(List<String> mensagens, String nomeCampo, TextBoxBase... tb) {
/*  61 */     boolean result = false;
/*     */     TextBoxBase[] arrayOfTextBoxBase;
/*  63 */     int j = (arrayOfTextBoxBase = tb).length; for (int i = 0; i < j; i++) { TextBoxBase textBoxBase = arrayOfTextBoxBase[i];
/*  64 */       if (!isEmpty(textBoxBase.getText())) {
/*  65 */         result |= returnValidateResult(true, textBoxBase);
/*     */       }
/*     */     }
/*     */     
/*  69 */     if (result) {
/*  70 */       return true;
/*     */     }
/*     */     
/*  73 */     mensagens.add(errors.validateRequired(nomeCampo));
/*     */     
/*  75 */     j = (arrayOfTextBoxBase = tb).length; for (int i = 0; i < j; i++) { TextBoxBase textBoxBase = arrayOfTextBoxBase[i];
/*  76 */       result &= returnValidateResult(false, textBoxBase);
/*     */     }
/*     */     
/*  79 */     return false;
/*     */   }
/*     */   
/*     */   public static boolean validateInteger(List<String> mensagens, String nomeCampo, TextBoxBase tb) {
/*  83 */     if (isEmpty(tb.getText())) {
/*  84 */       return returnValidateResult(true, tb);
/*     */     }
/*     */     try
/*     */     {
/*  88 */       return returnValidateResult(true, tb);
/*     */     } catch (NumberFormatException e) {
/*  90 */       mensagens.add(errors.validateInteger(nomeCampo)); }
/*  91 */     return returnValidateResult(false, tb);
/*     */   }
/*     */   
/*     */   public static boolean validateRequired(List<String> mensagens, String nomeCampo, CheckBox... cbs)
/*     */   {
/*  96 */     boolean checked = false;
/*     */     CheckBox[] arrayOfCheckBox;
/*  98 */     int j = (arrayOfCheckBox = cbs).length; for (int i = 0; i < j; i++) { CheckBox checkBox = arrayOfCheckBox[i];
/*  99 */       checked |= checkBox.getValue().booleanValue();
/*     */     }
/*     */     
/* 102 */     if (!checked) {
/* 103 */       mensagens.add(errors.validateRequired(nomeCampo));
/*     */     }
/*     */     
/* 106 */     return returnValidateResult(checked, cbs);
/*     */   }
/*     */   
/*     */   public static boolean validateMinLength(List<String> mensagens, String nomeCampo, TextBoxBase tb, int minLength) {
/* 110 */     if ((isEmpty(tb.getText())) || (tb.getText().trim().length() >= minLength)) {
/* 111 */       return returnValidateResult(true, tb);
/*     */     }
/*     */     
/* 114 */     mensagens.add(errors.validateMinLength(nomeCampo, minLength));
/*     */     
/* 116 */     return returnValidateResult(false, tb);
/*     */   }
/*     */   
/*     */   public static boolean validateMaxLength(List<String> mensagens, String nomeCampo, TextBoxBase tb, int maxLength) {
/* 120 */     if ((isEmpty(tb.getText())) || (tb.getText().trim().length() <= maxLength)) {
/* 121 */       return returnValidateResult(true, tb);
/*     */     }
/*     */     
/* 124 */     mensagens.add(errors.validateMaxLength(nomeCampo, maxLength));
/* 125 */     return returnValidateResult(false, tb);
/*     */   }
/*     */   
/*     */   public static boolean validateCEP(List<String> mensagens, String nomeCampo, TextBoxBase tb) {
/* 129 */     if ((isEmpty(tb.getText())) || (tb.getText().trim().matches("[0-9]{5}\\-[0-9]{3}"))) {
/* 130 */       return returnValidateResult(true, tb);
/*     */     }
/*     */     
/* 133 */     mensagens.add(errors.validateCEP(nomeCampo));
/* 134 */     return returnValidateResult(false, tb);
/*     */   }
/*     */   
/*     */   public static boolean validateTelefone(List<String> mensagens, String nomeCampo, TextBoxBase tb) {
/* 138 */     if ((isEmpty(tb.getText())) || (tb.getText().trim().matches("\\([0-9]{2}\\)[0-9]{4}\\-[0-9]{4}"))) {
/* 139 */       return returnValidateResult(true, tb);
/*     */     }
/*     */     
/* 142 */     mensagens.add(errors.validateTelefone(nomeCampo));
/* 143 */     return returnValidateResult(false, tb);
/*     */   }
/*     */   
/*     */   public static boolean validateEmail(List<String> mensagens, String nomeCampo, TextBoxBase tb) {
/* 147 */     if ((isEmpty(tb.getText())) || (tb.getText().trim().matches(".+@.+\\.[a-z]+"))) {
/* 148 */       return returnValidateResult(true, tb);
/*     */     }
/*     */     
/* 151 */     mensagens.add(errors.validateEmail(nomeCampo));
/* 152 */     return returnValidateResult(false, tb);
/*     */   }
/*     */ }
