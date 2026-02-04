# DevNotes AI - Decisiones Técnicas

Este archivo documenta las decisiones técnicas importantes del proyecto.
**Actualizar cada vez que se tome una decisión significativa.**

---

## Formato de Decisión

```
## [ID] Título de la Decisión
**Fecha:** YYYY-MM-DD
**Estado:** accepted | deprecated | superseded
**Contexto:** Por qué se necesitaba tomar esta decisión
**Decisión:** Qué se decidió
**Alternativas Consideradas:** Otras opciones evaluadas
**Consecuencias:** Impacto de la decisión
```

---

## Decisiones

### [DEC-001] Pivot del producto de "DevFocus" a "DevNotes AI"
**Fecha:** 2026-02-04
**Estado:** accepted

**Contexto:**
El proyecto original "DevFocus" intentaba ser una app de productividad para equipos con:
- Dashboard de proyectos
- Kanban board
- Editor de notas Markdown
- Autenticación

Sin embargo, GitHub Mobile ya ofrece todas estas funcionalidades de manera nativa y mejor integrada.

**Decisión:**
Pivotar el producto a "DevNotes AI" - una app de notas inteligente para desarrolladores que:
1. Se conecta a repositorios de GitHub
2. Usa IA para entender código y contexto
3. Ayuda a documentar decisiones técnicas con referencias reales

**Alternativas Consideradas:**
1. **Cross-Platform Project Hub** - Unificar GitHub, GitLab, Bitbucket, Jira
2. **Developer Learning Journal** - App para documentar aprendizaje
3. **Code Review Companion** - App enfocada en code reviews con IA
4. **Team Standup Tool** - Standups asincrónicos con auto-updates

**Consecuencias:**
- (+) Producto único sin competencia directa
- (+) Aprovecha la UI existente del proyecto
- (+) Mercado claro (desarrolladores)
- (-) Requiere integración con APIs externas (GitHub, OpenAI)
- (-) Costo operativo por uso de IA

---

### [DEC-002] Stack tecnológico para el proyecto
**Fecha:** 2026-02-04
**Estado:** accepted

**Contexto:**
Definir las tecnologías y librerías principales para el desarrollo.

**Decisión:**

| Área | Tecnología | Justificación |
|------|------------|---------------|
| Framework | Flutter | Ya establecido en el proyecto |
| State Management | Riverpod + code gen | Ya configurado, type-safe |
| Routing | GoRouter | Ya configurado, deep links |
| HTTP Client | Dio + Retrofit | Type-safe, interceptors |
| Local DB | Drift | Type-safe SQLite, reactive |
| Auth | flutter_appauth | OAuth 2.0 nativo |
| Secure Storage | flutter_secure_storage | Tokens seguros |
| Markdown Editor | flutter_quill | Rich editor, extensible |
| IA | OpenAI API (gpt-4o-mini) | Balance costo/calidad |
| Data Classes | Freezed | Inmutabilidad, copyWith |

**Alternativas Consideradas:**
- **State:** Bloc (más verbose), Provider (menos features)
- **DB:** Hive (NoSQL), Isar (nuevo), SharedPreferences (simple)
- **Editor:** markdown_editor (limitado), super_editor (complejo)
- **IA:** Claude API (mejor contexto largo), Ollama (local, requiere hardware)

**Consecuencias:**
- (+) Stack consistente y type-safe
- (+) Código generado reduce boilerplate
- (+) Buena documentación de todas las librerías
- (-) Tiempo de build aumenta por code generation
- (-) Curva de aprendizaje para Drift/Retrofit

---

### [DEC-003] Arquitectura Clean Architecture por feature
**Fecha:** 2026-02-04
**Estado:** accepted

**Contexto:**
Definir cómo organizar el código del proyecto.

**Decisión:**
Usar Clean Architecture organizada por features:

```
lib/src/features/<feature>/
├── data/
│   ├── datasources/    # APIs, DB, Storage
│   ├── models/         # DTOs, JSON serialization
│   └── repositories/   # Implementaciones
├── domain/
│   ├── entities/       # Objetos de negocio puros
│   ├── repositories/   # Interfaces abstractas
│   └── usecases/       # Lógica de negocio
└── presentation/
    ├── providers/      # Riverpod state
    ├── screens/        # Páginas
    └── widgets/        # Componentes UI
```

**Alternativas Consideradas:**
- **Por capa:** Separar en carpetas data/, domain/, presentation/ globales
- **MVC:** Model-View-Controller tradicional
- **Simple:** Todo junto sin separación clara

**Consecuencias:**
- (+) Cada feature es auto-contenida
- (+) Fácil de testear en aislamiento
- (+) Dependencias claras entre capas
- (-) Más archivos y carpetas
- (-) Puede sentirse over-engineered para features simples

---

### [DEC-004] GitHub OAuth en lugar de Firebase Auth
**Fecha:** 2026-02-04
**Estado:** accepted

**Contexto:**
Elegir sistema de autenticación para la app.

**Decisión:**
Usar autenticación directa con GitHub OAuth sin intermediarios.

**Justificación:**
1. La app está centrada en GitHub - tiene sentido usar su auth nativo
2. Obtenemos token de GitHub directamente para llamar sus APIs
3. Menos dependencias (no necesitamos Firebase)
4. Los usuarios de la app son desarrolladores - tienen cuenta GitHub

**Alternativas Consideradas:**
- **Firebase Auth:** Más features (email, phone), pero añade dependencia
- **Supabase Auth:** Open source, pero otra dependencia
- **Auth0:** Enterprise, overkill para este proyecto

**Consecuencias:**
- (+) Un solo token para auth y API calls
- (+) Sin dependencias de backend
- (+) Flujo simple y directo
- (-) Solo usuarios con GitHub pueden usar la app
- (-) Sin opción de email/password

---

### [DEC-005] OpenAI gpt-4o-mini como modelo de IA inicial
**Fecha:** 2026-02-04
**Estado:** accepted

**Contexto:**
Elegir modelo de IA para las funcionalidades inteligentes.

**Decisión:**
Usar `gpt-4o-mini` de OpenAI como modelo principal.

**Justificación:**
- Balance óptimo entre costo y calidad para código
- $0.15/1M input tokens, $0.60/1M output tokens (muy económico)
- Suficientemente bueno para explicar código y generar resúmenes
- API madura y estable

**Alternativas Consideradas:**
- **gpt-4o:** Mejor calidad pero ~10x más caro
- **Claude 3.5 Sonnet:** Mejor para contexto largo, API diferente
- **Ollama/Local:** Gratis pero requiere hardware del usuario
- **GitHub Copilot API:** Integración natural pero API limitada

**Consecuencias:**
- (+) Costo predecible y bajo (~$5-10/mes uso moderado)
- (+) Buena calidad para tareas de código
- (+) Fácil migrar a gpt-4o si se necesita más calidad
- (-) Límite de contexto (128k tokens, suficiente para la mayoría)
- (-) Dependencia de servicio externo

---

## Template para Nuevas Decisiones

```markdown
### [DEC-XXX] Título
**Fecha:** YYYY-MM-DD
**Estado:** accepted

**Contexto:**
[Descripción del problema o necesidad]

**Decisión:**
[Qué se decidió hacer]

**Alternativas Consideradas:**
- **Opción A:** [Descripción]
- **Opción B:** [Descripción]

**Consecuencias:**
- (+) [Beneficio]
- (-) [Desventaja]
```

---

*Última actualización: 2026-02-04*
