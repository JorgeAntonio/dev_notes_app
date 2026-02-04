# DevNotes AI - Plan Técnico

## Visión del Producto

**DevNotes AI** es una app de notas inteligente para desarrolladores que:

1. Se conecta a repositorios de GitHub
2. Usa IA para entender código y contexto
3. Ayuda a documentar decisiones técnicas con referencias reales al código

### Diferenciación

| Competidor | Qué hace | Qué le falta |
|------------|----------|--------------|
| GitHub Mobile | Ver/editar código, issues, PRs | No tiene notas personales ni IA contextual |
| Notion | Notas y docs | No entiende código, no se conecta a repos |
| Obsidian | Notas locales con links | Sin integración Git real, sin IA de código |
| ChatGPT/Copilot | IA para código | No persiste contexto, no está diseñado para notas |

---

## Arquitectura

```
┌─────────────────────────────────────────────────────────────┐
│                      DevNotes AI App                        │
│                       (Flutter)                             │
├─────────────────────────────────────────────────────────────┤
│  Presentation Layer                                         │
│  ├── Notes Screen → Editor de Markdown                      │
│  ├── Repos Screen → Dashboard de repos conectados           │
│  ├── AI Chat Screen → Chat contextual con código            │
│  └── Settings → GitHub OAuth, preferencias de IA            │
├─────────────────────────────────────────────────────────────┤
│  Domain Layer                                               │
│  ├── Entities: Note, Repository, CodeReference, AIContext   │
│  └── Use Cases: LinkNoteToCode, ExplainRepo, GenerateJournal│
├─────────────────────────────────────────────────────────────┤
│  Data Layer                                                 │
│  ├── GitHub API (REST/GraphQL) → Repos, PRs, Commits        │
│  ├── AI Service → OpenAI API para análisis                  │
│  └── Local Storage → Drift para notas offline               │
└─────────────────────────────────────────────────────────────┘
```

---

## Fases de Implementación

### Fase 0: Preparación y Limpieza

**Estado:** `pending`
**Estimación:** 2-3 días

#### Dependencias a Agregar

```yaml
dependencies:
  # HTTP & APIs
  dio: ^5.4.0
  retrofit: ^4.1.0
  
  # Auth
  flutter_appauth: ^6.0.3
  flutter_secure_storage: ^9.0.0
  
  # Database Local
  drift: ^2.15.0
  sqlite3_flutter_libs: ^0.5.0
  path_provider: ^2.1.2
  
  # Markdown Editor
  flutter_quill: ^9.3.0
  markdown: ^7.2.2
  
  # AI
  dart_openai: ^5.1.0
  
  # Utils
  uuid: ^4.3.3
  intl: ^0.19.0
  url_launcher: ^6.2.4
  freezed_annotation: ^2.4.1
  json_annotation: ^4.8.1

dev_dependencies:
  retrofit_generator: ^8.1.0
  drift_dev: ^2.15.0
  freezed: ^2.4.7
  json_serializable: ^6.7.1
```

#### Estructura de Carpetas

```
lib/
├── main.dart
└── src/
    ├── core/
    │   ├── app/
    │   ├── constants/
    │   │   ├── api_constants.dart
    │   │   └── app_constants.dart
    │   ├── routing/
    │   ├── theme/
    │   ├── database/
    │   │   ├── app_database.dart
    │   │   └── tables/
    │   ├── network/
    │   │   ├── dio_client.dart
    │   │   └── interceptors/
    │   └── errors/
    │       ├── failures.dart
    │       └── exceptions.dart
    │
    ├── features/
    │   ├── auth/
    │   │   ├── data/
    │   │   │   ├── datasources/
    │   │   │   ├── models/
    │   │   │   └── repositories/
    │   │   ├── domain/
    │   │   │   ├── entities/
    │   │   │   ├── repositories/
    │   │   │   └── usecases/
    │   │   └── presentation/
    │   │       ├── providers/
    │   │       ├── screens/
    │   │       └── widgets/
    │   │
    │   ├── repositories/
    │   ├── notes/
    │   ├── ai_assistant/
    │   └── settings/
    │
    └── shared/
        ├── widgets/
        └── utils/
```

#### Tareas

| ID | Tarea | Estado |
|----|-------|--------|
| 0.1 | Agregar nuevas dependencias a pubspec.yaml | `pending` |
| 0.2 | Crear estructura de carpetas | `pending` |
| 0.3 | Configurar Dio client base | `pending` |
| 0.4 | Crear clases de error/exceptions | `pending` |
| 0.5 | Limpiar código legacy/mockups | `pending` |

---

### Fase 1: GitHub OAuth y API

**Estado:** `pending`
**Estimación:** 1.5-2 semanas
**Dependencias:** Fase 0

#### Pre-requisitos

1. Crear OAuth App en https://github.com/settings/developers
   - Application name: DevNotes AI
   - Homepage URL: https://devnotes.ai
   - Callback URL: devnotesai://callback
2. Guardar Client ID y Client Secret

#### Tareas

| ID | Tarea | Dependencias | Estado |
|----|-------|--------------|--------|
| 1.1 | Configurar OAuth App en GitHub | - | `pending` |
| 1.2 | Crear api_constants.dart | 1.1 | `pending` |
| 1.3 | Implementar GitHubUser entity (Freezed) | 0.1 | `pending` |
| 1.4 | Implementar AuthRemoteDataSource | 1.2, 1.3 | `pending` |
| 1.5 | Implementar AuthLocalDataSource (secure storage) | 0.1 | `pending` |
| 1.6 | Implementar AuthRepository | 1.4, 1.5 | `pending` |
| 1.7 | Crear providers de auth (Riverpod) | 1.6 | `pending` |
| 1.8 | Actualizar AuthScreen con login real | 1.7 | `pending` |
| 1.9 | Implementar GitHubApiDataSource (Retrofit) | 1.2 | `pending` |
| 1.10 | Crear modelos: Repository, Commit, PR | 1.9 | `pending` |
| 1.11 | Crear pantalla "Mis Repos" | 1.9, 1.10 | `pending` |
| 1.12 | Tests unitarios para auth | 1.6 | `pending` |

---

### Fase 2: Sistema de Notas

**Estado:** `pending`
**Estimación:** 1.5-2 semanas
**Dependencias:** Fase 1

#### Modelo de Datos

```dart
// Tablas Drift
Notes:
  - id, uuid, title, content, contentJson
  - linkedRepoOwner, linkedRepoName, linkedFilePath
  - linkedLineStart, linkedLineEnd, linkedCommitSha, linkedPrNumber
  - tags, isPinned, isArchived
  - createdAt, updatedAt
  - aiSummary, aiSuggestions

CodeReferences:
  - id, noteId, repoOwner, repoName, filePath
  - lineStart, lineEnd, commitSha, codeSnippet
  - createdAt
```

#### Tareas

| ID | Tarea | Dependencias | Estado |
|----|-------|--------------|--------|
| 2.1 | Configurar Drift y crear tablas | Fase 1 | `pending` |
| 2.2 | Generar código Drift (build_runner) | 2.1 | `pending` |
| 2.3 | Crear entities Note y CodeLink (Freezed) | 2.1 | `pending` |
| 2.4 | Implementar NotesLocalDataSource | 2.2 | `pending` |
| 2.5 | Implementar NotesRepository | 2.4 | `pending` |
| 2.6 | Crear providers de notas (Riverpod) | 2.5 | `pending` |
| 2.7 | Implementar MarkdownEditor (Quill) | 2.3 | `pending` |
| 2.8 | Crear NoteEditorScreen | 2.6, 2.7 | `pending` |
| 2.9 | Actualizar NotesListScreen con datos reales | 2.6 | `pending` |
| 2.10 | Implementar búsqueda de notas | 2.6 | `pending` |
| 2.11 | Crear modal "Link to Code" | 2.6, Fase 1 | `pending` |
| 2.12 | Implementar tags para notas | 2.6 | `pending` |
| 2.13 | Tests para notes repository | 2.5 | `pending` |

---

### Fase 3: Integración de IA

**Estado:** `pending`
**Estimación:** 1.5-2 semanas
**Dependencias:** Fase 1, Fase 2

#### Use Cases de IA

1. **ExplainRepository** - Analiza estructura y README, genera resumen
2. **SummarizePullRequest** - Resume cambios de un PR para code review
3. **GenerateJournalEntry** - Crea entry de diario basado en commits del día
4. **SuggestForNote** - Sugiere mejoras/contexto para una nota
5. **Chat** - Conversación libre con contexto de código

#### Tareas

| ID | Tarea | Dependencias | Estado |
|----|-------|--------------|--------|
| 3.1 | Configurar cuenta OpenAI y API key | - | `pending` |
| 3.2 | Implementar OpenAiDataSource | 3.1 | `pending` |
| 3.3 | Crear use case ExplainRepository | 3.2, Fase 1 | `pending` |
| 3.4 | Crear use case SummarizePullRequest | 3.2, Fase 1 | `pending` |
| 3.5 | Crear use case GenerateJournalEntry | 3.2, Fase 1 | `pending` |
| 3.6 | Implementar AiChatScreen | 3.2 | `pending` |
| 3.7 | Integrar botón "Ask AI" en editor | 3.6, Fase 2 | `pending` |
| 3.8 | Crear modal "Explain This Repo" | 3.3 | `pending` |
| 3.9 | Agregar resumen de PR en detalle | 3.4 | `pending` |
| 3.10 | Implementar "Dev Journal" automático | 3.5 | `pending` |
| 3.11 | Configurar almacenamiento seguro de API key | 3.1 | `pending` |
| 3.12 | Agregar indicador de tokens/costo | 3.2 | `pending` |
| 3.13 | Tests para AI use cases (mocking) | 3.2-3.5 | `pending` |

---

### Fase 4: Pulido y Features Avanzadas

**Estado:** `pending`
**Estimación:** 1-1.5 semanas
**Dependencias:** Fases 1-3

#### Tareas

| ID | Tarea | Dependencias | Estado |
|----|-------|--------------|--------|
| 4.1 | Actualizar routing con nuevas pantallas | Fases 1-3 | `pending` |
| 4.2 | Implementar deep links a código en GitHub | Fase 2 | `pending` |
| 4.3 | Agregar pull-to-refresh en listas | Fase 1, 2 | `pending` |
| 4.4 | Implementar caché de repos/PRs | Fase 1 | `pending` |
| 4.5 | Agregar onboarding para nuevos usuarios | - | `pending` |
| 4.6 | Implementar export de notas a Markdown | Fase 2 | `pending` |
| 4.7 | Agregar soporte offline para notas | Fase 2 | `pending` |
| 4.8 | Implementar búsqueda global | Fase 1, 2 | `pending` |
| 4.9 | Agregar estadísticas de uso | Fase 2 | `pending` |
| 4.10 | Pulir animaciones y transiciones | - | `pending` |
| 4.11 | Agregar manejo de errores y estados vacíos | Todas | `pending` |
| 4.12 | Configurar CI/CD para tests | - | `pending` |
| 4.13 | Integration tests de flujos principales | Todas | `pending` |

---

## Resumen de Tiempos

| Fase | Tiempo Estimado | Estado |
|------|-----------------|--------|
| Fase 0: Preparación | 2-3 días | `pending` |
| Fase 1: GitHub OAuth/API | 1.5-2 semanas | `pending` |
| Fase 2: Sistema de Notas | 1.5-2 semanas | `pending` |
| Fase 3: Integración IA | 1.5-2 semanas | `pending` |
| Fase 4: Pulido | 1-1.5 semanas | `pending` |
| **Total MVP** | **6-8 semanas** | - |

---

## Costos Estimados

| Servicio | Costo | Notas |
|----------|-------|-------|
| GitHub API | Gratis | 5000 req/hr con OAuth |
| OpenAI (gpt-4o-mini) | ~$5-10/mes | Uso moderado |
| Firebase/Supabase | Gratis tier | Opcional para sync |
| Apple Developer | $99/año | App Store |
| Google Play | $25 una vez | Play Store |

---

## Grafo de Dependencias

```
Fase 0 ──► Fase 1 ──┬──► Fase 2 ──┬──► Fase 4
                    │             │
                    └──► Fase 3 ──┘
```

---

## Referencias de Código

### Ejemplos de Implementación

Ver `docs/examples/` para snippets de código de referencia:
- `github_auth_example.dart` - Flow de OAuth
- `drift_tables_example.dart` - Definición de tablas
- `openai_service_example.dart` - Integración con IA
- `markdown_editor_example.dart` - Editor de notas

---

*Última actualización: 2026-02-04*
