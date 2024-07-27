Este projeto é uma aplicação Java baseada em JSP e Servlets, que é executada em um servidor Tomcat 9.0.891. O projeto foi desenvolvido no IntelliJ IDEA utilizando Java 8.

## Tecnologias Utilizadas

- **Java 8**
- **JSP (JavaServer Pages)**
- **Bootstrap**
- **JavaScript**
- **Servlets**
- **Tomcat 9.0.891**

## Pré-requisitos

Certifique-se de ter os seguintes pré-requisitos instalados:

- **Java 8 JDK**: [Download e instruções](https://www.oracle.com/java/technologies/javase-jdk8-downloads.html)
- **Apache Tomcat 9.0.891**: [Download e instruções](https://tomcat.apache.org/download-90.cgi)
- **IntelliJ IDEA**: [Download e instruções](https://www.jetbrains.com/idea/download/)

## Configuração do Projeto

### Configuração do Tomcat

1. **Baixe e instale o Tomcat 9.0.891**:
   - Baixe o Tomcat do [site oficial](https://tomcat.apache.org/download-90.cgi).
   - Extraia o arquivo ZIP em um diretório de sua escolha.

2. **Configure o Tomcat no IntelliJ IDEA**:
   - Abra o IntelliJ IDEA.
   - Vá para **Run > Edit Configurations**.
   - Adicione uma nova configuração **Tomcat Server** e selecione **Local**.
   - No campo **Application server**, selecione o diretório onde você extraiu o Tomcat.
   - No campo **Deployment**, adicione o artefato `.war` do seu projeto.

### Configuração do Projeto no IntelliJ IDEA

1. **Importe o Projeto**:
   - Abra o IntelliJ IDEA.
   - Vá para **File > Open** e selecione o diretório do seu projeto.

2. **Configuração do SDK**:
   - Vá para **File > Project Structure**.
   - Em **Project Settings > Project**, defina o **Project SDK** como Java 8.

3. **Configuração do Build**:
   - No IntelliJ IDEA, vá para **File > Project Structure > Modules**.
   - Certifique-se de que o módulo está configurado para usar o **Java 8** e o **artefato WAR**.

## Compilação e Execução

### Compilar o Projeto

1. **Compilação**:
   - No IntelliJ IDEA, selecione **Build > Build Project** para compilar o projeto.

### Executar o Projeto

1. **Iniciar o Tomcat**:
   - No IntelliJ IDEA, vá para **Run > Edit Configurations** e selecione a configuração **Tomcat Server** que você criou.
   - Clique no botão **Run** (ícone de triângulo verde) para iniciar o Tomcat e implantar o projeto.

2. **Acessar a Aplicação**:
   - Abra um navegador web e acesse a aplicação em:
     ```
     http://localhost:8080/Zitrus
     ```

## SCRIPTS VIA LIQUIBASE 


# Documentação do Liquibase

Este repositório utiliza Liquibase para gerenciar o versionamento de dados no banco de dados. O arquivo Liquibase incluído neste projeto é responsável por adicionar registros iniciais à tabela `paciente`.

## Arquivo Liquibase

O arquivo Liquibase XML está localizado em `src/main/resources/db/db.changelog-master.xml` e contém o seguinte conteúdo:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<databaseChangeLog
        xmlns="http://www.liquibase.org/xml/ns/dbchangelog"
        xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
        xsi:schemaLocation="http://www.liquibase.org/xml/ns/dbchangelog
        http://www.liquibase.org/xml/ns/dbchangelog/dbchangelog-3.8.xsd">

    <changeSet id="1" author="Douglas Medeiros Peixoto">
        <insert tableName="paciente">
            <column name="nome" value="Douglas"/>
            <column name="idade" value="10"/>
            <column name="sexo" value="M"/>
            <column name="procedimento" value="1234"/>
        </insert>
        <insert tableName="paciente">
            <column name="nome" value="Gabriel"/>
            <column name="idade" value="20"/>
            <column name="sexo" value="M"/>
            <column name="procedimento" value="4567"/>
        </insert>
        <insert tableName="paciente">
            <column name="nome" value="Maria"/>
            <column name="idade" value="10"/>
            <column name="sexo" value="F"/>
            <column name="procedimento" value="6789"/>
        </insert>
        <insert tableName="paciente">
            <column name="nome" value="Lucas"/>
            <column name="idade" value="10"/>
            <column name="sexo" value="M"/>
            <column name="procedimento" value="6789"/>
        </insert>
        <insert tableName="paciente">
            <column name="nome" value="Carlos"/>
            <column name="idade" value="20"/>
            <column name="sexo" value="M"/>
            <column name="procedimento" value="1234"/>
        </insert>
        <insert tableName="paciente">
            <column name="nome" value="Nathalia"/>
            <column name="idade" value="30"/>
            <column name="sexo" value="F"/>
            <column name="procedimento" value="4567"/>
        </insert>
    </changeSet>

</databaseChangeLog>


