# MAUITest

Aplicación de ejemplo creada con **.NET MAUI** para ejecutarse en el simulador de iOS.

## 📋 Requisitos previos

Antes de compilar y ejecutar el proyecto, asegúrate de tener instalado:

- **macOS 15 o superior**  
- **.NET SDK 8.0.404**  
- **Xcode** (versión compatible con el simulador deseado)  
- **Workloads de MAUI e iOS** instalados:  

```bash
dotnet workload install maui-ios
```

> 💡 Para ver todos los workloads instalados:
> ```bash
> dotnet workload list
> ```

## 🚀 Configuración inicial

1. **Clonar el repositorio**
   ```bash
   git clone https://github.com/usuario/mauitest-maui.git
   cd mauitest-maui
   ```

2. **Restaurar dependencias**
   ```bash
   dotnet restore
   ```

3. **(Opcional) Verificar SDK y workloads**
   ```bash
   dotnet --info
   dotnet workload list
   ```

## ▶️ Ejecución en el simulador iOS

Para ejecutar en el simulador predeterminado:

```bash
dotnet build -t:Run -f net8.0-ios
```

Para elegir un simulador específico:

```bash
dotnet build -t:Run -f net8.0-ios -p:_DeviceName=:v2:udid=<UDID_DEL_SIMULADOR>
```

> Puedes listar los simuladores disponibles con:
> ```bash
> xcrun simctl list devices
> ```

## 🛠 Comandos útiles

- **Limpiar la solución**
  ```bash
  dotnet clean
  ```

- **Compilar sin ejecutar**
  ```bash
  dotnet build -f net8.0-ios
  ```

- **Ejecutar en modo Debug**
  ```bash
  dotnet build -t:Run -f net8.0-ios -c Debug
  ```

## 📦 Publicación

Para generar un paquete para distribución (TestFlight/App Store), deberás:

1. Configurar la firma en `Info.plist` y `Entitlements.plist`.
2. Compilar en configuración **Release**.
3. Usar `dotnet publish` o integrar con **Fastlane**/**Xcode**.
