package net.ibmemorial.ummes.shared;

import com.google.gwt.user.client.rpc.IsSerializable;
import java.io.Serializable;
import java.util.List;

public class Page<V> implements Serializable, IsSerializable {
	private List<V> results;
	private int resultsPerPage;
	private int pageNumber;
	private boolean last;

	public Page() {
		this(null, 0, 0, true);
	}

	public Page(List<V> results, int pageNumber, int resultsPerPage, boolean last) {
		this.results = results;
		this.pageNumber = pageNumber;
		this.resultsPerPage = resultsPerPage;
		this.last = last;
	}

	public List<V> getResults() {
		return this.results;
	}

	public int getResultsPerPage() {
		return this.resultsPerPage;
	}

	public int getPageNumber() {
		return this.pageNumber;
	}

	public boolean isFirst() {
		return this.pageNumber == 0;
	}

	public boolean isLast() {
		return this.last;
	}
}
