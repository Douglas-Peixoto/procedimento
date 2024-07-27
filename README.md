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

## Estrutura do Projeto

