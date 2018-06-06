package net.ibmemorial.ummes.server;

import net.ibmemorial.ummes.shared.Page;

public abstract interface Pager<V>
{
  public abstract Page<V> getPage(int paramInt1, int paramInt2);
}
