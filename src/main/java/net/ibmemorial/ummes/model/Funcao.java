package net.ibmemorial.ummes.model;

public enum Funcao implements IEnum {
	FACILITADOR(1), HOSPEDEIRO(2), AMBOS(99);

	private final int id;

	private Funcao(int id) {
		this.id = id;
	}

	public int getId() {
		return this.id;
	}

	public static Funcao valueOf(int id) {
		Funcao[] arrayOfFuncao;
		int j = (arrayOfFuncao = values()).length;
		for (int i = 0; i < j; i++) {
			Funcao f = arrayOfFuncao[i];
			if (f.id == id) {
				return f;
			}
		}

		return null;
	}
}
