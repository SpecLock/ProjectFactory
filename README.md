# ProjectFactory

## Características principales:

### Project Factory:

- Crea nuevos contratos de proyectos con `createProject`.
- Almacena todos los proyectos creados en un array.
- Emite un evento `ProjectCreated` con la dirección del nuevo proyecto.

### Contrato Project:

#### Estructura de datos:

- Nombre y descripción del proyecto.
- Dirección del desarrollador.
- Array de hitos con título, fecha tentativa, descripción y monto.

#### Funcionalidades:

- `addMilestone`: Añade nuevos hitos (solo owner).
- `completeMilestone`: Marca hitos como completados (solo desarrollador).
- `approveMilestone`: Libera fondos del escrow (solo owner).

### Seguridad:

- Modificador `onlyOwner` para funciones restringidas.
- Validación de montos y estados.
- Prevención de re-entrada en pagos.

### Flujo de trabajo típico:

1. Cliente crea proyecto vía Factory enviando el capital total.
2. Cliente añade hitos con sus respectivos montos.
3. Desarrollador completa los hitos.
4. Cliente aprueba y libera los fondos.
5. Los fondos se transfieren directamente al desarrollador.
