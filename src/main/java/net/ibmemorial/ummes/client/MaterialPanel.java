package net.ibmemorial.ummes.client;

import com.google.gwt.user.client.ui.Anchor;
import com.google.gwt.user.client.ui.HTML;
import com.google.gwt.user.client.ui.VerticalPanel;

public class MaterialPanel extends com.google.gwt.user.client.ui.LazyPanel
{
  private final UmMesParaViver entry;
  
  public MaterialPanel(UmMesParaViver entry)
  {
    this.entry = entry;
  }
  
  protected com.google.gwt.user.client.ui.Widget createWidget() {
    VerticalPanel panel = new VerticalPanel();
    panel.setSpacing(3);
    
    panel.add(new HTML("<h2>Material de Apoio</h2>"));
    
    panel.add(new Anchor("Guia de Treinamento para Facilitadores", "material/Treinamento Facilitadores-30dias.pdf"));
    panel.add(new Anchor("Roteiro das Reuniões para Facilitadores", "material/Roteiro - facilitador - Um Mes para Viver.doc"));
    panel.add(new Anchor("Roteiro das Reuniões para Hospedeiros", "material/Roteiro - hospedeiro - Um Mes para Viver.doc"));
    panel.add(new HTML("<hr>"));
    
    panel.add(new Anchor("1° Estudo para Facilitadores", "material/Facilitadores-30dias (estudo 1).doc"));
    panel.add(new Anchor("2° Estudo para Facilitadores", "material/Facilitadores-30dias (estudo 2).doc"));
    panel.add(new Anchor("3° Estudo para Facilitadores", "material/Facilitadores-30dias (estudo 3).doc"));
    panel.add(new Anchor("4° Estudo para Facilitadores", "material/Facilitadores-30dias (estudo 4).doc"));
    panel.add(new HTML("<hr>"));
    
    panel.add(new HTML("<h2>Material de Apoio para Adolescentes</h2>"));
    panel.add(new Anchor("1° Estudo para Adolescentes", "material/1o ESTUDO-adolescentes.doc"));
    panel.add(new Anchor("2° Estudo para Adolescentes", "material/2o ESTUDO-adolescentes.doc"));
    panel.add(new Anchor("3° Estudo para Adolescentes", "material/3o ESTUDO-adolescentes.doc"));
    panel.add(new Anchor("4° Estudo para Adolescentes", "material/4o ESTUDO-adolescentes.doc"));
    
    return panel;
  }
}
