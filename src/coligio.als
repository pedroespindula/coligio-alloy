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
abstract sig Usuario {}

sig Professor extends Usuario{}
sig Aluno extends Usuario{}

-- Facts

fact todaDisciplinaPertenceAoColigio {
	all d: Disciplina | one d.coligio
}

fact todoUsuarioPertenceAoColigio {
	all u: Usuario | one u.coligio
}

fact todaAtividadeSoTemUmaDisciplina {
	all a: Atividade | one a.disciplina
}

-- Functions

fun coligio (d: Disciplina) : set Coligio {
	d.~disciplinas
}

fun coligio (u: Usuario) : set Coligio {
	u.~usuarios
}

fun disciplina (a: Atividade) : set Disciplina {
	a.~atividades
}

fun disciplinas (a: Aluno) : set Disciplina {
	a.~alunos
}

fun disciplinas (p: Professor) : set Disciplina {
	p.~professor
}

-- Asserts

assert umAlunoPodeTerMaisDeUmaDisciplina {
	all a: Aluno | some a.disciplinas
}
assert umProfessorPodeTerMaisDeUmaDisciplina {
	all p: Professor | some p.disciplinas
}

assert doisProfessoresNaoPodemTerAMesmaDisciplina {
	all p1: Professor | all p2: Professor |no p1.disciplinas - p2.disciplinas
}

pred show[]{ }
run show for 5
