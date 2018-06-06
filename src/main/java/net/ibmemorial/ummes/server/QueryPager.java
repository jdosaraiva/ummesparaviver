/*    */ package net.ibmemorial.ummes.server;
/*    */ 
/*    */ import java.util.List;
/*    */ import net.ibmemorial.ummes.shared.Page;
/*    */ import org.hibernate.Query;
/*    */ 
/*    */ public class QueryPager<V> implements Pager<V>
/*    */ {
/*    */   private final Query query;
/*    */   
/*    */   public QueryPager(Query query)
/*    */   {
/* 13 */     this.query = query;
/*    */   }
/*    */   
/*    */   public Page<V> getPage(int pageNumber, int resultsPerPage) {
/* 17 */     return getPage(pageNumber, resultsPerPage, false);
/*    */   }
/*    */   
/*    */ 
/*    */   private Page<V> getPage(int pageNumber, int resultsPerPage, boolean last)
/*    */   {
/* 23 */     if (pageNumber < 0) {
/* 24 */       pageNumber = 0;
/*    */     }
/*    */     
/* 27 */     this.query.setFirstResult(pageNumber * resultsPerPage);
/* 28 */     this.query.setMaxResults(resultsPerPage);
/* 29 */     List<V> results = this.query.list();
/* 30 */     if ((pageNumber > 0) && (results.isEmpty())) {
/* 31 */       return getPage(pageNumber - 1, resultsPerPage, true);
/*    */     }
/*    */     
/* 34 */     return new Page(results, pageNumber, resultsPerPage, (last) || 
/* 35 */       (results.size() < resultsPerPage));
/*    */   }
/*    */ }
