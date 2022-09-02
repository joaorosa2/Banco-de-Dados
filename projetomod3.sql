--CRIAÇÃO DAS TABELAS--
CREATE TABLE "facilitadores" (
  "id_facilitador" int PRIMARY KEY,
    "id_departamento_fk" int,
    "nome_facilitador" varchar(100),
     "matricula_facilitador" int
);

CREATE TABLE "departamentos" (
    "id_departamento" int PRIMARY KEY,
  "tipo_de_departamento" varchar(100)   
);

CREATE TABLE "modulos_developer" (
  "id_modulo_developer" int PRIMARY KEY,
  "conteudo_hard_skills" varchar(1000),
  "conteudo_soft_skills" varchar(1000),
  "id_facilitador_hard_fk" int,
  "id_facilitador_soft_fk" int,
  "id_curso_fk" int,
  "quantidade_de_aulas" int
);

CREATE TABLE "modulos_data" (
  "id_modulo_data_science" int PRIMARY KEY,
  "conteudo_hard_skills" varchar(1000),
  "conteudo_soft_skills" varchar(1000),
  "id_facilitador_hard_fk" int,
  "id_facilitador_soft_fk" int,
  "id_curso_fk" int,
  "quantidade_de_aulas" int
);

CREATE TABLE "cursos" (
  "id_curso" int  PRIMARY KEY,
  "curso" varchar(100)
);

CREATE TABLE "turma" (
  "id_turma" int  PRIMARY KEY,
  "id_facilitador_soft" int,
  "id_facilitador_tech" int,
  "id_curso_fk8" int,
  "id_modulo_developer_fk" int,
  "id_modulo_data_science_fk" int 
);

CREATE TABLE "aluno" (
  "id_aluno" int  PRIMARY KEY,
  "nome_do_aluno" varchar(100),
  "idade_aluno" int ,
  "estado_do_aluno" varchar(100),
  "matricula_aluno" int ,
  "id_curso_fk2" int ,
  "id_turma_fk" int 
);

CREATE TABLE "cadastro" (
  "id_cadastro" int  PRIMARY KEY,
  "id_aluno_fk" int,
  "id_facilitador_fk" int,
  "id_curso_fk3" int
);

--REFERENCIANDO AS CHAVES ESTRANGEIRAS--
ALTER TABLE "aluno" ADD FOREIGN KEY ("id_curso_fk2") REFERENCES "cursos" ("id_curso");

ALTER TABLE "turma" ADD FOREIGN KEY ("id_facilitador_soft") REFERENCES "facilitadores" ("id_facilitador");

ALTER TABLE "turma" ADD FOREIGN KEY ("id_facilitador_tech") REFERENCES "facilitadores" ("id_facilitador");

ALTER TABLE "aluno" ADD FOREIGN KEY ("id_turma_fk") REFERENCES "turma" ("id_turma");

ALTER TABLE "cadastro" ADD FOREIGN KEY ("id_aluno_fk") REFERENCES "aluno" ("id_aluno");

ALTER TABLE "cadastro" ADD FOREIGN KEY ("id_facilitador_fk") REFERENCES "facilitadores" ("id_facilitador");

ALTER TABLE "cadastro" ADD FOREIGN KEY ("id_curso_fk3") REFERENCES "cursos" ("id_curso");

ALTER TABLE "facilitadores" ADD FOREIGN KEY ("id_departamento_fk") REFERENCES "departamentos" ("id_departamento");

ALTER TABLE "modulos_developer" ADD FOREIGN KEY ("id_facilitador_hard_fk") REFERENCES "facilitadores" ("id_facilitador");

ALTER TABLE "modulos_developer" ADD FOREIGN KEY ("id_facilitador_soft_fk") REFERENCES "facilitadores" ("id_facilitador");

ALTER TABLE "modulos_developer" ADD FOREIGN KEY ("id_curso_fk") REFERENCES "cursos" ("id_curso");

ALTER TABLE "modulos_data" ADD FOREIGN KEY ("id_facilitador_hard_fk") REFERENCES "facilitadores" ("id_facilitador");

ALTER TABLE "modulos_data" ADD FOREIGN KEY ("id_facilitador_soft_fk") REFERENCES "facilitadores" ("id_facilitador");

ALTER TABLE "modulos_data" ADD FOREIGN KEY ("id_curso_fk") REFERENCES "cursos" ("id_curso");

ALTER TABLE "turma" ADD FOREIGN KEY ("id_curso_fk8") REFERENCES "cursos" ("id_curso");

ALTER TABLE "turma" ADD FOREIGN KEY ("id_modulo_developer_fk") REFERENCES "modulos_developer" ("id_modulo_developer");

ALTER TABLE "turma" ADD FOREIGN KEY ("id_modulo_data_science_fk") REFERENCES "modulos_data" ("id_modulo_data_science");

--INSERINDO DADOS NA TABELA DEPARTAMENTO--
INSERT INTO departamentos (id_departamento, tipo_de_departamento) values (1, 'Soft Skills');
INSERT INTO departamentos (id_departamento, tipo_de_departamento) values (2, 'Hard Skills');


--INSERINDO DADOS NA TABELA FACILITADOES--
INSERT INTO facilitadores (id_facilitador, id_departamento_fk, 
                           nome_facilitador, matricula_facilitador) values (1, 1, 'Esli', 202241),
                                                                           (2, 2, 'Marisa', 202250),
                                                                           (3, 2, 'Dayson', 202281),
                                                                           (4, 2, 'Rafael', 202271),
                                                                           (5, 2, 'Guilherme', 2022101),
                                                                           (6, 2, 'Valentina',202225),
                                                                           (7, 2, 'Maria', 202288),
                                                                           (8, 1, 'André', 2022746),
                                                                           (9, 2, 'Vagner', 2022789),
                                                                           (10, 2, 'Ana', 2021963);

--INSERINDO DADOS NA TABELA CURSOS--
INSERT INTO cursos (id_curso, curso) values (1, 'Data Science'),
                                            (2, 'Web Developer');

--INSERINDO DADOS NA TABELA MODULOS REFERENTE AO CURSO DE DATA SCIENCE--
INSERT INTO modulos_data (id_modulo_data_science, conteudo_hard_skills, conteudo_soft_skills, id_facilitador_hard_fk,
            id_facilitador_soft_fk,
            id_curso_fk, quantidade_de_aulas) values (1, 'Introdução à programação, algoritmo e pensamento computacional e 
                                                      lógica de programação',
                                                      'Mindset de crescimento, aprender a aprender e 
                                                      gestão de tempo', 2, 1, 1, 20),

                                                      (2, 'Estrutura de dados: listas, dicionários; funções, procedimentos e 
                                                      métodos e bibliotecas',
                                                      'Inteligência emocional, gestão de conflitos, relacionamento interpessoal, 
                                                      trabalho em equipe', 3, 1, 1, 19),

                                                      (3, 'Análise de dados, banco dados relacionais, 
                                                      banco de dados não-relacionais
                                                      consultas recorrentes com SQL','Capacidade investigativa e metodologias ágeis', 4, 1, 1, 25),

                                                      (4, 'Pandas, Google Colab, estatística descritiva, 
                                                      visualização de dados', 'Postura profissional, visão de negócios e clientes, inovação e criatividade', 6, 1, 1, 20),

                                                      (5, 'Introdução a mineração de dados, análise e tratamento de dados
                                                      , introdução ao storytelling', 'Capacidade investigativa, pensamento crítico, ética e privacidade', 10, 1, 1, 22),

                                                      (6, 'Introdução ao Tableau, funcionalidades úteis e operações em tabelas
                                                      ', 'Empregabilidade e postura em processos seletivos', 10, 1, 1, 20);

--INSERINDO DADOS NA TABELA MODULOS REFERENTE AO CURSO DE WEB DEVELOPER--
INSERT INTO modulos_developer (id_modulo_developer, conteudo_hard_skills, 
            conteudo_soft_skills, id_facilitador_hard_fk,
            id_facilitador_soft_fk,
            id_curso_fk, quantidade_de_aulas) values (1, 'HTML5, CSS3, lógica de programação, Javascript, git e github',
                                                      'Praticar competências e hábitos comportamentais', 5, 8, 2, 21),

                                                      (2, 'Criação de págias dinâmicas, orietação a objetos e requisições à APIs',
                                                      'Lidar com suas emoções, manter equilíbrioemocional sob pressão e estresse, trabalhar em
                                                      equipe com uma boa comunicação para gerir os conflitos interpessoais.', 5, 8, 2, 26),

                                                      (3, 'Modelar banco de dados, realizar operações de
                                                      escrita, leitura, atualização e consultas avançadas nos bancos de dados, focadas em Business Intelligence.', 
                                                      'Utilizar de metodologias ágeis para entregar continuamente valor ao cliente, priorizar demandas, adaptar às mudanças e aplicar o framework SCRUM 
                                                      para a realização de projetos.', 4, 8, 2, 27), 

                                                      (4, 'Criar APIs para interagir com o banco de dados, permitindo que diversos sistemas possam consumir e interagir com os dados da aplicação.',
                                                      'Adotar postura profissional esperada pelo mercado, aplicando ferramentas de criatividade e inovação para propor ideias e fazer perguntas inteligentes.',
                                                      7, 8, 2, 22),      

                                                      (5, 'Criar interfaces e componentes com React, usando abordagem de classes e funcional. Estará criando seus próprios Hooks customizados. e conhecendo as 
                                                      bibliotecas de estilização mais utilizadas no mercado.', 'Conhecer seus objetivos pessoais e de carreira, aofinal da jornada você se preparar para processos
                                                      seletivos de Desenvolvedor Jr e encontrar sua empresa.', 9, 8, 2, 20);

--INSERIR OS DADOS NA TABELA TURMA--

INSERT INTO turma (id_turma,id_facilitador_soft,id_facilitador_tech,
                   id_curso_fk8,id_modulo_developer_fk,id_modulo_data_science_fk)
    values (1,1,4,1,null,3);
INSERT INTO turma (id_turma,id_facilitador_soft,id_facilitador_tech,
                   id_curso_fk8,id_modulo_developer_fk,id_modulo_data_science_fk)
    values (2,1,2,1,null,1);

INSERT INTO turma (id_turma,id_facilitador_soft,id_facilitador_tech,
                   id_curso_fk8,id_modulo_developer_fk,id_modulo_data_science_fk)
     values (3,5,4,2,2,null);
     
INSERT INTO turma (id_turma,id_facilitador_soft,id_facilitador_tech,
                  id_curso_fk8,id_modulo_developer_fk,id_modulo_data_science_fk)
       values (4,1,3,2,4,null);

--INSERIR OS DADOS NA TABELA ALUNOS - TURMA 01 DADOS --
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (1,'Antonio Carlos',31,'SP',001,1,1);
INSERT INTO aluno(id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (2,'Amanda Alves',26,'MG',002,1,1);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (3,'Lucas Ribeiro',18,'PR',003,1,1);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (4,'Isabelly Moura',23,'ES',004,1,1);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (5,'Pietra Viana',29,'PE',005,1,1);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (6,'Calebe Moreira',36,'RJ',006,1,1);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (7,'Clara da Paz',22,'DF',007,1,1);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (8,'Ana Nogueira',20,'RJ',008,1,1);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (9,'Pedro Lucas Pereira',29,'SP',009,1,1);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (10,'Luiza Farias',21,'PA',010,1,1);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (11,'Lucas Gabriel da Rosa',33,'MS',011,1,1);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (12,'Cecília Dias',34,'PI',012,1,1);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (13,'Vicente da Cruz',44,'PA',013,1,1);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (14,'Ana Lívia Cunha',24,'MG',014,1,1);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (15,'Vinicius Lima',24,'SP',015,1,1);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (16,'Diego Cunha',32,'BA',016,1,1);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (17,'Sarah Barbosa',19,'RO',017,1,1);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (18,'Isaac Viana',25,'RJ',018,1,1);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (19,'Beatriz Mendes',28,'RN',019,1,1);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (20,'Daniela Vieira',32,'SC',020,1,1);

--INSERIR OS DADOS NA TABELA ALUNOS - TURMA 02 DADOS --
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (21,'Maria Fernanda Fogaça',31,'SP',021,1,2);
INSERT INTO aluno(id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (22,'Milena Cardoso',26,'MG',022,1,2);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (23,'Vinicius Caldeira',18,'PR',023,1,2);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (24,'Yago Araújo',23,'ES',024,1,2);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (25,'Guilherme Campos',29,'PE',025,1,2);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (26,'Júlia Barbosa',36,'RJ',026,1,2);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (27,'Caio Aragão',22,'DF',027,1,2);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (28,'Kaique Nascimento',20,'RJ',028,1,2);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (29,'Agatha Rezende',29,'SP',029,1,2);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (30,'Lorena Mendes',21,'PA',030,1,2);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (31,'Igor Lima',33,'MS',011,1,2);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (32,'Maria Cecília Nunes',34,'PI',032,1,2);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (33,'Alícia Fernandes',44,'PA',033,1,2);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (34,'Vinicius Pinto',24,'MG',034,1,2);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (35,'Daniela Peixoto',24,'SP',035,1,2);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (36,'Clara Viana',32,'BA',036,1,2);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (37,'Alana Freitas',19,'RO',037,1,2);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (38,'Luiz Otávio Martins',25,'RJ',038,1,2);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (39,'Ian Gomes',28,'RN',039,1,2);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (40,'Rafaela Peixoto',32,'SC',040,1,2);

--INSERIR OS DADOS NA TABELA ALUNOS - TURMA 03 WEB DEV --
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (41,'Nathan Fogaça',31,'SP',041,2,3);
INSERT INTO aluno(id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (42,'Maria Fernanda Nunes',26,'MG',042,2,3);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (43,'Lavínia Pereira',18,'PR',043,2,3);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (44,'Bernardo Campos',23,'ES',044,2,3);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (45,'Giovanna Barbosa',29,'PE',045,2,3);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (46,'Laura Cardoso',36,'RJ',046,2,3);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (47,'Manuela Pereira',22,'DF',047,2,3);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (48,'Rebeca Lima',20,'RJ',048,2,3);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (49,'Theo Almeida',29,'SP',049,2,3);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (50,'Maria Fernanda das Neves',21,'PA',050,2,3);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (51,'Alana Santos',33,'MS',051,2,3);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (52,'Sofia da Rocha',34,'PI',052,2,3);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (53,' Bárbara Araújo',44,'PA',053,2,3);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (54,'Eloah Alves',24,'MG',054,2,3);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (55,'Rafael Fernandes',24,'SP',055,2,3);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (56,'João Miguel Correia',32,'BA',056,2,3);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (57,'Pietro Farias',19,'RO',057,2,3);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (58,'Bryan Dias',25,'RJ',058,2,3);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (59,'Camila Oliveira',28,'RN',059,2,3);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (60,'Lívia Aragão',32,'SC',060,2,3);

--INSERIR OS DADOS NA TABELA ALUNOS - TURMA 04 WEB DEV --
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (61,'Rebeca Porto',31,'SP',061,2,4);
INSERT INTO aluno(id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (62,'Luiza Carvalho',26,'MG',062,2,4);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (63,'Yago Nunes',18,'PR',063,2,4);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (64,'Anthony Rezende',23,'ES',064,2,4);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (65,'Davi da Conceição',29,'PE',065,2,4);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (66,' Paulo Nunes',36,'RJ',066,2,4);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (67,'Isadora Campos',22,'DF',067,2,4);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (68,'Davi da Rosa',20,'RJ',068,2,4);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (69,'Cauê da Conceição',29,'SP',069,2,4);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (70,'Bianca Campos',21,'PA',070,2,4);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (71,'Enzo Gabriel da Mata',33,'MS',071,2,4);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (72,'Levi Cavalcanti',34,'PI',072,2,4);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (73,' Sarah Barros',44,'PA',073,2,4);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (74,'Kaique Moraes',24,'MG',074,2,4);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (75,'Matheus Caldeira',24,'SP',075,2,4);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (76,'Joana Cardoso',32,'BA',076,2,4);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (77,'Isabel Pereira',19,'RO',077,2,4);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (78,'João Rezende',25,'RJ',078,2,4);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (79,'Samuel Vieira',28,'RN',079,2,4);
INSERT INTO aluno (id_aluno,nome_do_aluno,idade_aluno,estado_do_aluno,matricula_aluno,id_curso_fk2,id_turma_fk)
    values (80,'Milena Cunha',32,'SC',080,2,4);
    
-- Alimentando tabela (Cadastro)

INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (101,1,1,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (102,2,1,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (103,3,1,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (104,4,2,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (105,5,2,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (106,6,1,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (107,7,1,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (108,8,2,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (109,9,1,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (110,10,2,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (111,11,2,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (112,12,1,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (113,13,1,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (114,14,1,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (115,15,2,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (116,16,1,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (117,17,1,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (118,18,2,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (119,19,1,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (120,20,1,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (121,21,1,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (122,22,1,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (123,23,1,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (124,24,2,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (125,25,2,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (126,26,1,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (127,27,1,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (128,28,2,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (129,29,1,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (130,30,2,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (131,31,2,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (132,32,1,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (133,33,1,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (134,34,1,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (135,35,2,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (136,36,1,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (137,37,1,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (138,38,2,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (139,39,1,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (140,40,1,1);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (141,41,1,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (142,42,1,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (143,43,1,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (144,44,2,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (145,45,2,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (146,46,1,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (147,47,1,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (148,48,2,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (149,49,1,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (150,50,2,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (151,51,2,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (152,52,1,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (153,53,1,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (154,54,1,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (155,55,2,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (156,56,1,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (157,57,1,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (158,58,2,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (159,59,1,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (160,60,1,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (161,61,1,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (162,62,1,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (163,63,1,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (164,64,2,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (165,65,2,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (166,66,1,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (167,67,1,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (168,68,2,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (169,69,1,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (170,70,2,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (171,71,2,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (172,72,1,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (173,73,1,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (174,74,1,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (175,75,2,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (176,76,1,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (177,77,1,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (178,78,2,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (179,79,1,2);
INSERT INTO cadastro (id_cadastro,id_aluno_fk,id_facilitador_fk,id_curso_fk3)
    values (180,80,1,2);

    
--CONSULTAS TABELAS--
SELECT * FROM facilitadores;
SELECT * FROM aluno;
SELECT * FROM cadastro;
SELECT * FROM cursos;
SELECT * FROM departamentos;
SELECT * FROM modulos_data;
SELECT * FROM modulos_developer;
SELECT * FROM turma;


--ADICIONANDO NOVAS INFOS EM ALUNO

ALTER TABLE aluno add column genero varchar;
ALTER TABLE aluno add column trabalho bool;

-- Preenchendo as novas colunas

UPDATE aluno set genero = 'Masculino' where id_aluno = 1,
UPDATE aluno set trabalho = '0' where id_aluno = 1;

UPDATE aluno set 
genero = 'Feminino',
trabalho = '1'
where id_aluno = 2;

UPDATE aluno set 
genero = 'Masculino',
trabalho = '1'
where id_aluno = 3;

update aluno set genero= 'Masculino' where id_aluno IN (9,11,13,15,16);
update aluno set genero = 'Feminino' where id_aluno IN (4,5,7,9,10,12,14,20)
update aluno set genero = 'Outros' where id_aluno IN (6,8,17,18,19)

update aluno set genero= 'Masculino' where id_aluno IN (23, 24,25,28,31,38,41,44,49);
update aluno set genero = 'Feminino' where id_aluno IN (21,22,26,30,32,35,36,42,46,47,48,51);
update aluno set genero = 'Outros' where id_aluno IN (27,29,33,34,37,39,40,43,45,50);

update aluno set genero= 'Masculino' where id_aluno IN (5,56,57,63,64,66,71,72,74,75,79);
update aluno set genero = 'Feminino' where id_aluno IN (52,53,54,59,61,62,67,73,76,77);
update aluno set genero = 'Outros' where id_aluno IN (58,60,65,68,69,70,78,80);

update aluno set trabalho = '0' where id_aluno IN (4,9,20,7,11,20,12,14,15,16,18);
update aluno set trabalho = '1' where id_aluno IN (5,6,19,17,7,10,8,13);


update aluno set trabalho = '0' where id_aluno IN (4,9,20,7,11,20,12,14,15,16,18);
update aluno set trabalho = '1' where id_aluno IN (5,6,19,17,7,10,8,13);
update aluno set trabalho = '1' where id_aluno IN (45,46,50,52,53,71,74,75,78,79,64,60,54,65,72,77,22,24,26,28,30,31);
update aluno set trabalho = '0' where id_aluno IN (80,73,62,67,70,47,48,51,57,68,41,44,49,55,56,58,63,66,69,59,76,40,42,43,61,21,23,25,27,29,32,33,34,35,36,37,38,39,40);

UPDATE modulos_data SET id_facilitador_hard_fk = 2 where id_modulo_data_science in (4,5,6);
UPDATE modulos_data SET id_facilitador_soft_fk = 1 where id_modulo_data_science in (4);
UPDATE modulos_data SET id_facilitador_soft_fk = 5 where id_modulo_data_science in (5,6);



-- 1 CONSULTA: SELECIONAR A QUANTIDADE TOTAL DE ESTUDANTES CADASTRADOS NO BANCO 
SELECT  COUNT(nome_do_aluno)
FROM aluno;

-- 2 CONSULTA: SELECIONAR TODOS OS ESTUDANTES COM OS RESPECTIVOS CURSOS QUE ELES ESTÃO CADASTRADOS

-- DADOS 
SELECT * 
FROM aluno
WHERE id_curso_fk2 = 1;

-- WEB DEV
SELECT * 
FROM aluno
WHERE id_curso_fk2 = 2

--JUNÇÃO DE DUAS TABELAS PARA APRESENTAR EM QUAIS CURSOS OS ALUNOS ESTÃO INSCRITOS
select cursos.curso, aluno.nome_do_aluno from aluno
inner join cursos
on cursos.id_curso = aluno.id_curso_fk2


--3 CONSULTA: REALIZANDO O AGRUPAMENTO DA QUANTIDADE DE ALUNOS POR ESTADO
SELECT estado_do_aluno, 
COUNT(*) AS total_por_estado FROM aluno 
GROUP BY estado_do_aluno order by total_por_estado desc;

-- 4 CONSULTA: SELECIONANDO ALUNOS DO GÊNERO FEMININO E QUE TRABALHA

select * from aluno where genero = 'Feminino'
and trabalho !='0';

-- 5 CONSULTA: SELECIONAR QUAIS FACILITADORES ATUAM EM MAIS DE UMA TURMA
--FACILITADOR HARD SKILLS --DATA SCIENCE
select facilitadores.nome_facilitador, id_facilitador_hard_fk, count(id_facilitador_hard_fk)
from modulos_data
inner join facilitadores
on facilitadores.id_facilitador = modulos_data.id_facilitador_hard_fk
group by nome_facilitador, id_facilitador_hard_fk
having count(id_facilitador_hard_fk) > 1;

----FACILITADOR SOFT SKILLS --DATA SCIENCE
select facilitadores.nome_facilitador, id_facilitador_soft_fk, count(id_facilitador_soft_fk)
from modulos_data
inner join facilitadores
on facilitadores.id_facilitador = modulos_data.id_facilitador_soft_fk
group by nome_facilitador, id_facilitador_soft_fk
having count(id_facilitador_soft_fk) > 1;

----FACILITADOR SOFT SKILLS --WEB DEVELOPER
select facilitadores.nome_facilitador, id_facilitador_soft_fk, count(id_facilitador_soft_fk)
from modulos_developer
inner join facilitadores
on facilitadores.id_facilitador = modulos_developer.id_facilitador_soft_fk
group by nome_facilitador, id_facilitador_soft_fk
having count(id_facilitador_soft_fk) > 1;

----FACILITADOR HARD SKILLS --WEB DEVELOPER
select facilitadores.nome_facilitador, id_facilitador_hard_fk, count(id_facilitador_hard_fk)
from modulos_developer
inner join facilitadores
on facilitadores.id_facilitador = modulos_developer.id_facilitador_hard_fk
group by nome_facilitador, id_facilitador_hard_fk
having count(id_facilitador_hard_fk) > 1;


-- 6 CONSULTA: SELECIONAR QUAIS ALUNOS DO CURSO DE DADOS ESTÃO ACIMA DA MÉDIA DE IDADE

SELECT nome_do_aluno, idade_aluno FROM aluno
WHERE idade_aluno > (select avg(idade_aluno) from aluno)
AND  id_curso_fk2 =1;
