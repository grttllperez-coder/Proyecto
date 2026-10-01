# Plaza Tezontle

Frontend de Plaza Tezontle con React, TypeScript, Vite y Tailwind CSS.

## Cambios recientes
- Paleta oscura y elegante con carbón, grafito y dorado.
- Pantalla de inicio de sesión.
- Pantalla para crear cuenta.
- Perfil de usuario.
- El botón de renta de un local solicita iniciar sesión antes de mostrar el formulario.
- La sesión demo se conserva en `localStorage` del navegador.
- No depende de Figma Make.

## Ejecutar

```bash
npm install
npm run dev
```

## Nota
La autenticación actual es de demostración en frontend. Para producción debe conectarse al backend y a PostgreSQL para validar credenciales de forma segura.

## Vistas por rol

### Usuario
El usuario puede:
- Consultar tiendas, restaurantes y servicios.
- Revisar promociones.
- Consultar el mapa y directorio.
- Ver locales disponibles y solicitar información.
- Crear/iniciar sesión en su cuenta y consultar su perfil.

### Administrador
El administrador cuenta con un panel separado para la demostración con:
- Resumen de tiendas, promociones, locales y restaurantes.
- Consulta y búsqueda de tiendas.
- Consulta y búsqueda de promociones.
- Control visual del estado de locales.
- Bandeja de solicitudes: nuevas, en revisión y atendidas.
- Actividad reciente y accesos rápidos.

**Cuenta administrativa de demostración**
- Correo: `admin@parquetezontle.com`
- Contraseña: `admin123`

> La autenticación de esta versión es demostrativa y se guarda en `localStorage`; no sustituye un sistema de autenticación de producción.
