-- Especificação Formal do Colig.io em Alloy

-- Equipe: 
-- Arthur Silva Lima Guedes
-- Bruno Roberto Silva de Siqueira
-- Dayvid Daniel da Silva
-- Danilo de Menezes Freitas
-- Felipe de Amorim Ferreira
-- Gabriel Fernandes da Costa
-- João Pedro Santa Cruz Sobral
-- João Pedro Santino Espíndula
-- Luis Eduardo Barroso Mafra
-- Talita Galdino Gouveia
-- Vitor Braga Diniz

module coligio

-- Assinaturas

one sig Coligio {
	disciplinas: some Disciplina,
	atividades: some Atividade,
	usuarios: some Usuario
}

-- Disciplina
sig Disciplina {
	professor: one Professor,
	alunos: some Aluno,
	atividades: set Atividade
}
sig Atividade{}

-- Usuário
abstract sig Usuario {
	disciplinas: set Disciplina
}

sig Professor extends Usuario{}
sig Aluno extends Usuario{}


-- Fatos


-- Atividade
fact{
	all a:Atividade | all c:Coligio | a in c.atividades
	all a:Atividade | all d:Disciplina | a in d.atividades
}

-- Disciplina
fact{
	all d:Disciplina | all c:Coligio | d.professor in c.usuarios
	all d:Disciplina | all c:Coligio | d.alunos in c.usuarios
	all d:Disciplina | all c:Coligio | d.atividades in c.atividades

}

-- 
fact{
	all p:Usuario | all c:Coligio | p in c.usuarios
	all p:Usuario | all c:Coligio | p.disciplinas in c.disciplinas
}

pred show[]{ }
run show for 2
