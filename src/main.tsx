import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App'
import './index.css'

class AppErrorBoundary extends React.Component<
  { children: React.ReactNode },
  { hasError: boolean; message: string }
> {
  state = { hasError: false, message: '' }

  static getDerivedStateFromError(error: unknown) {
    return {
      hasError: true,
      message: error instanceof Error ? error.message : 'Error desconocido al cargar la aplicación.',
    }
  }

  render() {
    if (!this.state.hasError) return this.props.children

    return (
      <main style={{ minHeight: '100vh', display: 'grid', placeItems: 'center', padding: 24, fontFamily: 'system-ui, sans-serif', background: '#FAFAF8' }}>
        <section style={{ maxWidth: 680, width: '100%', background: 'white', border: '1px solid #E0D5CC', borderRadius: 16, padding: 28, boxShadow: '0 12px 40px rgba(28,20,16,.08)' }}>
          <h1 style={{ margin: '0 0 10px', color: '#C1440E', fontSize: 28 }}>No se pudo cargar la Plaza</h1>
          <p style={{ margin: '0 0 16px', color: '#3D2B22' }}>La aplicación encontró un error de ejecución.</p>
          <pre style={{ whiteSpace: 'pre-wrap', background: '#F2ECE5', padding: 14, borderRadius: 10, overflow: 'auto', color: '#3D2B22' }}>{this.state.message}</pre>
          <button onClick={() => window.location.reload()} style={{ border: 0, borderRadius: 10, padding: '10px 16px', background: '#C1440E', color: 'white', cursor: 'pointer', fontWeight: 700 }}>Recargar</button>
        </section>
      </main>
    )
  }
}

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <AppErrorBoundary>
      <App />
    </AppErrorBoundary>
  </React.StrictMode>,
)
