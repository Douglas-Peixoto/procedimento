package br.com.zitrus.models;

public class Paciente {

    private Long id;

    private String nome;

    private String idade;

    private String sexo;

    private String procedimento;

    // Construtores
    public Paciente() {}

    public Paciente(String nome, String idade, String sexo,String procedimento ) {
        this.nome = nome;
        this.idade = idade;
        this.sexo = sexo;
        this.procedimento = procedimento;
    }

    // Getters e Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getIdade() {
        return idade;
    }

    public void setIdade(String idade) {
        this.idade = idade;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getProcedimento() {
        return procedimento;
    }

    public void setProcedimento(String procedimento) {
        this.procedimento = procedimento;
    }
}

