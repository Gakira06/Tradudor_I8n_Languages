-- =============================================================
-- Thiago Iazzetti - Traducoes de Navbar (6 idiomas)
-- Sistema: website
-- Todas as chaves terminam com sufixo THIAGOIAZZETTI
-- =============================================================

INSERT INTO sistemas (codigo, nome, descricao)
VALUES ('website', 'Website Principal', 'Portal publico da aplicacao')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO idiomas (codigo, nome, direcao) VALUES
    ('en-US', 'English (United States)',    'ltr'),
    ('it-IT', 'Italiano',                  'ltr'),
    ('pt-PT', 'Portugues (Portugal)',       'ltr'),
    ('pt-BR', 'Portugues (Brasil)',         'ltr'),
    ('es-ES', 'Espanol (Espana)',           'ltr'),
    ('ar-MA', 'Arabic (Morocco)',           'rtl')
ON CONFLICT (codigo) DO NOTHING;

INSERT INTO traducoes (chave, valor, sistema_id, idioma_id)
SELECT t.chave, t.valor, s.id, i.id
FROM (VALUES
  ('NAV_HOME_THIAGOIAZZETTI', 'pt-BR', 'Home'),
  ('NAV_HOME_THIAGOIAZZETTI', 'pt-PT', 'Home'),
  ('NAV_HOME_THIAGOIAZZETTI', 'en-US', 'Home'),
  ('NAV_HOME_THIAGOIAZZETTI', 'it-IT', 'Home'),
  ('NAV_HOME_THIAGOIAZZETTI', 'es-ES', 'Inicio'),
  ('NAV_HOME_THIAGOIAZZETTI', 'ar-MA', 'الرئيسية'),

  ('NAV_PLANS_THIAGOIAZZETTI', 'pt-BR', 'Planos'),
  ('NAV_PLANS_THIAGOIAZZETTI', 'pt-PT', 'Planos'),
  ('NAV_PLANS_THIAGOIAZZETTI', 'en-US', 'Plans'),
  ('NAV_PLANS_THIAGOIAZZETTI', 'it-IT', 'Piani'),
  ('NAV_PLANS_THIAGOIAZZETTI', 'es-ES', 'Planes'),
  ('NAV_PLANS_THIAGOIAZZETTI', 'ar-MA', 'الخطط'),

  ('NAV_CONTACT_THIAGOIAZZETTI', 'pt-BR', 'Entre em contato'),
  ('NAV_CONTACT_THIAGOIAZZETTI', 'pt-PT', 'Entre em contacto'),
  ('NAV_CONTACT_THIAGOIAZZETTI', 'en-US', 'Get in touch'),
  ('NAV_CONTACT_THIAGOIAZZETTI', 'it-IT', 'Contattaci'),
  ('NAV_CONTACT_THIAGOIAZZETTI', 'es-ES', 'Ponte en contacto'),
  ('NAV_CONTACT_THIAGOIAZZETTI', 'ar-MA', 'تواصل معنا'),

  ('NAV_SECTION_TITLE_THIAGOIAZZETTI', 'pt-BR', 'Navegacao'),
  ('NAV_SECTION_TITLE_THIAGOIAZZETTI', 'pt-PT', 'Navegacao'),
  ('NAV_SECTION_TITLE_THIAGOIAZZETTI', 'en-US', 'Navigation'),
  ('NAV_SECTION_TITLE_THIAGOIAZZETTI', 'it-IT', 'Navigazione'),
  ('NAV_SECTION_TITLE_THIAGOIAZZETTI', 'es-ES', 'Navegacion'),
  ('NAV_SECTION_TITLE_THIAGOIAZZETTI', 'ar-MA', 'التنقل'),

  ('NAV_OVERVIEW_THIAGOIAZZETTI', 'pt-BR', 'Visao Geral'),
  ('NAV_OVERVIEW_THIAGOIAZZETTI', 'pt-PT', 'Visao Geral'),
  ('NAV_OVERVIEW_THIAGOIAZZETTI', 'en-US', 'Overview'),
  ('NAV_OVERVIEW_THIAGOIAZZETTI', 'it-IT', 'Panoramica'),
  ('NAV_OVERVIEW_THIAGOIAZZETTI', 'es-ES', 'Resumen'),
  ('NAV_OVERVIEW_THIAGOIAZZETTI', 'ar-MA', 'نظرة عامة'),

  ('NAV_STUDENTS_THIAGOIAZZETTI', 'pt-BR', 'Alunos'),
  ('NAV_STUDENTS_THIAGOIAZZETTI', 'pt-PT', 'Alunos'),
  ('NAV_STUDENTS_THIAGOIAZZETTI', 'en-US', 'Students'),
  ('NAV_STUDENTS_THIAGOIAZZETTI', 'it-IT', 'Studenti'),
  ('NAV_STUDENTS_THIAGOIAZZETTI', 'es-ES', 'Alumnos'),
  ('NAV_STUDENTS_THIAGOIAZZETTI', 'ar-MA', 'الطلاب'),

  ('NAV_WORKOUTS_THIAGOIAZZETTI', 'pt-BR', 'Treinos'),
  ('NAV_WORKOUTS_THIAGOIAZZETTI', 'pt-PT', 'Treinos'),
  ('NAV_WORKOUTS_THIAGOIAZZETTI', 'en-US', 'Workouts'),
  ('NAV_WORKOUTS_THIAGOIAZZETTI', 'it-IT', 'Allenamenti'),
  ('NAV_WORKOUTS_THIAGOIAZZETTI', 'es-ES', 'Entrenamientos'),
  ('NAV_WORKOUTS_THIAGOIAZZETTI', 'ar-MA', 'التمارين'),

  ('NAV_SCHEDULE_THIAGOIAZZETTI', 'pt-BR', 'Agenda'),
  ('NAV_SCHEDULE_THIAGOIAZZETTI', 'pt-PT', 'Agenda'),
  ('NAV_SCHEDULE_THIAGOIAZZETTI', 'en-US', 'Schedule'),
  ('NAV_SCHEDULE_THIAGOIAZZETTI', 'it-IT', 'Agenda'),
  ('NAV_SCHEDULE_THIAGOIAZZETTI', 'es-ES', 'Agenda'),
  ('NAV_SCHEDULE_THIAGOIAZZETTI', 'ar-MA', 'الجدول'),

  ('NAV_DIETS_THIAGOIAZZETTI', 'pt-BR', 'Dietas'),
  ('NAV_DIETS_THIAGOIAZZETTI', 'pt-PT', 'Dietas'),
  ('NAV_DIETS_THIAGOIAZZETTI', 'en-US', 'Diets'),
  ('NAV_DIETS_THIAGOIAZZETTI', 'it-IT', 'Diete'),
  ('NAV_DIETS_THIAGOIAZZETTI', 'es-ES', 'Dietas'),
  ('NAV_DIETS_THIAGOIAZZETTI', 'ar-MA', 'الانظمة الغذائية'),

  ('NAV_COMMUNICATION_THIAGOIAZZETTI', 'pt-BR', 'Comunicacao'),
  ('NAV_COMMUNICATION_THIAGOIAZZETTI', 'pt-PT', 'Comunicacao'),
  ('NAV_COMMUNICATION_THIAGOIAZZETTI', 'en-US', 'Communication'),
  ('NAV_COMMUNICATION_THIAGOIAZZETTI', 'it-IT', 'Comunicazione'),
  ('NAV_COMMUNICATION_THIAGOIAZZETTI', 'es-ES', 'Comunicacion'),
  ('NAV_COMMUNICATION_THIAGOIAZZETTI', 'ar-MA', 'التواصل'),

  ('NAV_MY_PANEL_THIAGOIAZZETTI', 'pt-BR', 'Meu Painel'),
  ('NAV_MY_PANEL_THIAGOIAZZETTI', 'pt-PT', 'Meu Painel'),
  ('NAV_MY_PANEL_THIAGOIAZZETTI', 'en-US', 'My Dashboard'),
  ('NAV_MY_PANEL_THIAGOIAZZETTI', 'it-IT', 'Il Mio Pannello'),
  ('NAV_MY_PANEL_THIAGOIAZZETTI', 'es-ES', 'Mi Panel'),
  ('NAV_MY_PANEL_THIAGOIAZZETTI', 'ar-MA', 'لوحتي'),

  ('HEADER_PERSONAL_PANEL_THIAGOIAZZETTI', 'pt-BR', 'Painel do Personal'),
  ('HEADER_PERSONAL_PANEL_THIAGOIAZZETTI', 'pt-PT', 'Painel do Personal'),
  ('HEADER_PERSONAL_PANEL_THIAGOIAZZETTI', 'en-US', 'Coach Dashboard'),
  ('HEADER_PERSONAL_PANEL_THIAGOIAZZETTI', 'it-IT', 'Pannello Coach'),
  ('HEADER_PERSONAL_PANEL_THIAGOIAZZETTI', 'es-ES', 'Panel del Entrenador'),
  ('HEADER_PERSONAL_PANEL_THIAGOIAZZETTI', 'ar-MA', 'لوحة المدرب'),

  ('HEADER_MY_AREA_THIAGOIAZZETTI', 'pt-BR', 'Minha Area'),
  ('HEADER_MY_AREA_THIAGOIAZZETTI', 'pt-PT', 'Minha Area'),
  ('HEADER_MY_AREA_THIAGOIAZZETTI', 'en-US', 'My Area'),
  ('HEADER_MY_AREA_THIAGOIAZZETTI', 'it-IT', 'La Mia Area'),
  ('HEADER_MY_AREA_THIAGOIAZZETTI', 'es-ES', 'Mi Area'),
  ('HEADER_MY_AREA_THIAGOIAZZETTI', 'ar-MA', 'منطقتي'),

  ('HEADER_PUBLIC_PAGE_THIAGOIAZZETTI', 'pt-BR', 'Pagina publica'),
  ('HEADER_PUBLIC_PAGE_THIAGOIAZZETTI', 'pt-PT', 'Pagina publica'),
  ('HEADER_PUBLIC_PAGE_THIAGOIAZZETTI', 'en-US', 'Public page'),
  ('HEADER_PUBLIC_PAGE_THIAGOIAZZETTI', 'it-IT', 'Pagina pubblica'),
  ('HEADER_PUBLIC_PAGE_THIAGOIAZZETTI', 'es-ES', 'Pagina publica'),
  ('HEADER_PUBLIC_PAGE_THIAGOIAZZETTI', 'ar-MA', 'الصفحة العامة'),

  ('NAV_SIGN_OUT_THIAGOIAZZETTI', 'pt-BR', 'Sair'),
  ('NAV_SIGN_OUT_THIAGOIAZZETTI', 'pt-PT', 'Sair'),
  ('NAV_SIGN_OUT_THIAGOIAZZETTI', 'en-US', 'Sign out'),
  ('NAV_SIGN_OUT_THIAGOIAZZETTI', 'it-IT', 'Esci'),
  ('NAV_SIGN_OUT_THIAGOIAZZETTI', 'es-ES', 'Salir'),
  ('NAV_SIGN_OUT_THIAGOIAZZETTI', 'ar-MA', 'خروج'),

  ('ROLE_PERSONAL_ADMIN_THIAGOIAZZETTI', 'pt-BR', 'Personal Admin'),
  ('ROLE_PERSONAL_ADMIN_THIAGOIAZZETTI', 'pt-PT', 'Personal Admin'),
  ('ROLE_PERSONAL_ADMIN_THIAGOIAZZETTI', 'en-US', 'Coach Admin'),
  ('ROLE_PERSONAL_ADMIN_THIAGOIAZZETTI', 'it-IT', 'Admin Coach'),
  ('ROLE_PERSONAL_ADMIN_THIAGOIAZZETTI', 'es-ES', 'Admin Entrenador'),
  ('ROLE_PERSONAL_ADMIN_THIAGOIAZZETTI', 'ar-MA', 'مشرف المدرب'),

  ('ROLE_STUDENT_THIAGOIAZZETTI', 'pt-BR', 'Aluno'),
  ('ROLE_STUDENT_THIAGOIAZZETTI', 'pt-PT', 'Aluno'),
  ('ROLE_STUDENT_THIAGOIAZZETTI', 'en-US', 'Student'),
  ('ROLE_STUDENT_THIAGOIAZZETTI', 'it-IT', 'Studente'),
  ('ROLE_STUDENT_THIAGOIAZZETTI', 'es-ES', 'Alumno'),
  ('ROLE_STUDENT_THIAGOIAZZETTI', 'ar-MA', 'الطالب')
) AS t(chave, codigo_idioma, valor)
JOIN sistemas s ON s.codigo = 'website'
JOIN idiomas i ON i.codigo = t.codigo_idioma
ON CONFLICT (chave, sistema_id, idioma_id)
DO UPDATE SET valor = EXCLUDED.valor, atualizado_em = NOW();
