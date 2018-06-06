/*    */ package net.ibmemorial.ummes.server;
/*    */ 
/*    */ import javax.mail.PasswordAuthentication;
/*    */ 
/*    */ public class SmtpAuthenticator extends javax.mail.Authenticator
/*    */ {
/*    */   private final String username;
/*    */   private final String password;
/*    */   
/*    */   public SmtpAuthenticator(String username, String password) {
/* 11 */     this.username = username;
/* 12 */     this.password = password;
/*    */   }
/*    */   
/*    */   public PasswordAuthentication getPasswordAuthentication() {
/* 16 */     return new PasswordAuthentication(this.username, this.password);
/*    */   }
/*    */ }
