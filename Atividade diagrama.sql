CREATE TABLE Sala (
    id_sala SERIAL PRIMARY KEY,
    nome_sala VARCHAR(50) NOT NULL,
    capacidade INTEGER NOT NULL,
    faixa_etaria VARCHAR(30)
);

CREATE TABLE Bebe (
    id_bebe SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    sexo CHAR(1),
    peso_nascimento NUMERIC(5,2),
    altura_nascimento NUMERIC(5,2),
    tipo_sanguineo VARCHAR(3),

    id_sala INTEGER,

    CONSTRAINT fk_sala
        FOREIGN KEY (id_sala)
        REFERENCES Sala(id_sala)
);

CREATE TABLE Responsavel (
    id_responsavel SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    telefone VARCHAR(20),
    email VARCHAR(100),
    endereco VARCHAR(200),
    parentesco VARCHAR(30)
);

CREATE TABLE Funcionario (
    id_funcionario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) UNIQUE,
    cargo VARCHAR(50),
    telefone VARCHAR(20),
    salario NUMERIC(10,2),
    data_admissao DATE,

    id_sala INTEGER,

    CONSTRAINT fk_funcionario_sala
        FOREIGN KEY (id_sala)
        REFERENCES Sala(id_sala)
);

CREATE TABLE Matricula (
    id_matricula SERIAL PRIMARY KEY,
    data_matricula DATE NOT NULL,
    status VARCHAR(20),

    id_bebe INTEGER NOT NULL,

    CONSTRAINT fk_matricula_bebe
        FOREIGN KEY (id_bebe)
        REFERENCES Bebe(id_bebe)
);

CREATE TABLE Responsavel_Bebe (
    id_responsavel INTEGER,
    id_bebe INTEGER,

    PRIMARY KEY (id_responsavel, id_bebe),

    CONSTRAINT fk_resp
        FOREIGN KEY (id_responsavel)
        REFERENCES Responsavel(id_responsavel),

    CONSTRAINT fk_bebe
        FOREIGN KEY (id_bebe)
        REFERENCES Bebe(id_bebe)
);