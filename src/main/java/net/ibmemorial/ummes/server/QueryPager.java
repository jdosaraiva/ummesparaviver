package net.ibmemorial.ummes.server;

import java.util.List;
import net.ibmemorial.ummes.shared.Page;
import org.hibernate.Query;

public class QueryPager<V> implements Pager<V> {
	private final Query query;

	public QueryPager(Query query) {
		this.query = query;
	}

	public Page<V> getPage(int pageNumber, int resultsPerPage) {
		return getPage(pageNumber, resultsPerPage, false);
	}

	private Page<V> getPage(int pageNumber, int resultsPerPage, boolean last) {
		if (pageNumber < 0) {
			pageNumber = 0;
		}

		this.query.setFirstResult(pageNumber * resultsPerPage);
		this.query.setMaxResults(resultsPerPage);
		List<V> results = this.query.list();
		if ((pageNumber > 0) && (results.isEmpty())) {
			return getPage(pageNumber - 1, resultsPerPage, true);
		}

		return new Page(results, pageNumber, resultsPerPage, (last) || (results.size() < resultsPerPage));
	}
}
