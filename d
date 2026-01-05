<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Datto BDR - Pilot Test Template</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --bg-dark: #0a0e27;
            --bg-card: #131833;
            --accent-cyan: #00ff9f;
            --accent-blue: #00d4ff;
            --text-main: #e0e0e0;
            --text-dim: #8b92b5;
            --border: #1e2749;
            --danger: #ff3366;
            --warning: #ffaa00;
            --success: #00ff9f;
        }

        body {
            background: linear-gradient(135deg, var(--bg-dark) 0%, #0f1429 100%);
            color: var(--text-main);
            font-family: 'Courier New', monospace;
            line-height: 1.6;
            min-height: 100vh;
            padding: 20px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            background: var(--bg-card);
            border: 2px solid var(--border);
            border-radius: 12px;
            box-shadow: 0 0 40px rgba(0, 255, 159, 0.1);
        }

        /* Header */
        .header {
            background: linear-gradient(135deg, #1a1f3a 0%, #0d1125 100%);
            padding: 30px;
            border-bottom: 2px solid var(--accent-cyan);
            position: relative;
            overflow: hidden;
        }

        .header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 2px;
            background: linear-gradient(90deg, var(--accent-cyan), var(--accent-blue), var(--accent-cyan));
            animation: scan 3s linear infinite;
        }

        @keyframes scan {
            0% { transform: translateX(-100%); }
            100% { transform: translateX(100%); }
        }

        .header h1 {
            color: var(--accent-cyan);
            font-size: 2em;
            text-transform: uppercase;
            letter-spacing: 3px;
            text-shadow: 0 0 10px var(--accent-cyan);
            margin-bottom: 10px;
        }

        .header .subtitle {
            color: var(--text-dim);
            font-size: 0.9em;
            letter-spacing: 2px;
        }

        .client-id {
            background: rgba(0, 255, 159, 0.1);
            border: 1px solid var(--accent-cyan);
            padding: 10px 15px;
            margin: 20px 30px;
            border-radius: 6px;
            font-size: 0.85em;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .status-indicator {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .status-dot {
            width: 8px;
            height: 8px;
            background: var(--success);
            border-radius: 50%;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% { opacity: 1; box-shadow: 0 0 5px var(--success); }
            50% { opacity: 0.5; box-shadow: 0 0 15px var(--success); }
        }

        /* Action Bar */
        .action-bar {
            position: fixed;
            top: 20px;
            right: 20px;
            z-index: 1000;
            display: flex;
            gap: 10px;
        }

        .btn {
            padding: 12px 24px;
            background: var(--bg-card);
            border: 2px solid var(--accent-cyan);
            color: var(--accent-cyan);
            cursor: pointer;
            border-radius: 6px;
            font-family: 'Courier New', monospace;
            font-size: 0.9em;
            transition: all 0.3s;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .btn:hover {
            background: var(--accent-cyan);
            color: var(--bg-dark);
            box-shadow: 0 0 20px var(--accent-cyan);
        }

        /* Content Sections */
        .content {
            padding: 30px;
        }

        .section {
            margin-bottom: 30px;
            background: rgba(30, 39, 73, 0.3);
            border: 1px solid var(--border);
            border-radius: 8px;
            padding: 20px;
        }

        .section-title {
            color: var(--accent-blue);
            font-size: 1.2em;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 1px solid var(--border);
            display: flex;
            align-items: center;
            gap: 10px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .section-title::before {
            content: '▶';
            color: var(--accent-cyan);
        }

        /* Form Elements */
        input[type="text"],
        input[type="date"],
        input[type="email"],
        input[type="tel"],
        textarea,
        select {
            width: 100%;
            background: rgba(10, 14, 39, 0.5);
            border: 1px solid var(--border);
            color: var(--text-main);
            padding: 10px;
            border-radius: 4px;
            font-family: 'Courier New', monospace;
            font-size: 0.9em;
            margin-top: 5px;
        }

        input:focus,
        textarea:focus,
        select:focus {
            outline: none;
            border-color: var(--accent-cyan);
            box-shadow: 0 0 10px rgba(0, 255, 159, 0.2);
        }

        input::placeholder,
        textarea::placeholder {
            color: var(--text-dim);
            font-style: italic;
        }

        .grid-2 {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
        }

        .grid-4 {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
        }

        label {
            color: var(--accent-cyan);
            font-size: 0.85em;
            display: block;
            margin-bottom: 5px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        /* Dynamic Items */
        .dynamic-item {
            background: rgba(0, 212, 255, 0.05);
            border: 1px solid var(--border);
            padding: 15px;
            border-radius: 6px;
            margin-bottom: 10px;
            position: relative;
        }

        .dynamic-item-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
            padding-bottom: 10px;
            border-bottom: 1px solid var(--border);
        }

        .dynamic-item-title {
            color: var(--accent-blue);
            font-weight: bold;
        }

        .btn-remove {
            background: none;
            border: 1px solid var(--danger);
            color: var(--danger);
            padding: 5px 10px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.8em;
            transition: all 0.3s;
        }

        .btn-remove:hover {
            background: var(--danger);
            color: white;
        }

        .btn-add {
            background: none;
            border: 1px solid var(--accent-cyan);
            color: var(--accent-cyan);
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 0.85em;
            margin-top: 10px;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }

        .btn-add:hover {
            background: rgba(0, 255, 159, 0.1);
        }

        /* Checklist */
        .checklist {
            background: rgba(0, 0, 0, 0.3);
            padding: 15px;
            border-radius: 6px;
            border: 1px solid var(--border);
        }

        .checklist-item {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 8px;
            margin: 5px 0;
            border-radius: 4px;
            cursor: pointer;
            transition: all 0.3s;
        }

        .checklist-item:hover {
            background: rgba(0, 255, 159, 0.05);
        }

        .checklist-item input[type="checkbox"] {
            width: 18px;
            height: 18px;
            cursor: pointer;
        }

        .checklist-item label {
            margin: 0;
            cursor: pointer;
            text-transform: none;
            font-size: 0.9em;
        }

        /* Scope Boxes */
        .scope-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .scope-box {
            border-radius: 6px;
            padding: 15px;
        }

        .scope-include {
            background: rgba(0, 255, 159, 0.05);
            border: 2px solid var(--success);
        }

        .scope-exclude {
            background: rgba(255, 51, 102, 0.05);
            border: 2px solid var(--danger);
        }

        .scope-title {
            font-weight: bold;
            margin-bottom: 10px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .scope-include .scope-title {
            color: var(--success);
        }

        .scope-exclude .scope-title {
            color: var(--danger);
        }

        /* Table */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            border: 1px solid var(--border);
            padding: 10px;
            text-align: left;
        }

        th {
            background: rgba(0, 212, 255, 0.1);
            color: var(--accent-blue);
            text-transform: uppercase;
            font-size: 0.85em;
            letter-spacing: 1px;
        }

        td input, td select {
            margin: 0;
        }

        /* Scenarios */
        .scenario-item {
            background: rgba(0, 0, 0, 0.3);
            border: 1px solid var(--border);
            padding: 15px;
            border-radius: 6px;
            margin-bottom: 10px;
        }

        .scenario-header {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 10px;
        }

        .scenario-header input[type="checkbox"] {
            width: 18px;
            height: 18px;
        }

        .scenario-name {
            color: var(--accent-cyan);
            font-weight: bold;
        }

        /* Notes */
        .note-box {
            background: rgba(255, 170, 0, 0.1);
            border-left: 4px solid var(--warning);
            padding: 15px;
            margin-top: 30px;
            border-radius: 4px;
        }

        .note-title {
            color: var(--warning);
            font-weight: bold;
            margin-bottom: 10px;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .note-list {
            color: var(--text-dim);
            font-size: 0.85em;
            line-height: 1.8;
        }

        .note-list li {
            margin-left: 20px;
        }

        code {
            background: rgba(0, 0, 0, 0.5);
            padding: 2px 6px;
            border-radius: 3px;
            color: var(--accent-cyan);
        }

        @media print {
            body {
                background: white;
                color: black;
            }
            
            .action-bar,
            .note-box,
            .btn-add,
            .btn-remove {
                display: none !important;
            }

            .container {
                border: none;
                box-shadow: none;
            }
        }

        @media (max-width: 768px) {
            .grid-2,
            .grid-4,
            .scope-grid {
                grid-template-columns: 1fr;
            }

            .action-bar {
                position: static;
                margin-bottom: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="action-bar">
        <button class="btn" onclick="window.print()">
            <span>🖨️</span> EXPORT PDF
        </button>
    </div>

    <div class="container">
        <div class="header">
            <h1>⚡ DATTO BDR PILOT TEST</h1>
            <div class="subtitle">>> BACKUP & DISASTER RECOVERY VALIDATION PROTOCOL</div>
        </div>

        <div class="client-id">
            <span>CLIENT_ID: <strong id="clientDisplay">default</strong></span>
            <div class="status-indicator">
                <div class="status-dot"></div>
                <span>AUTO-SAVE: ACTIVE</span>
            </div>
        </div>

        <div class="content">
            <!-- PROJECT INFO -->
            <div class="section">
                <div class="section-title">📋 PROJECT INFORMATION</div>
                <div class="grid-2">
                    <div>
                        <label>Cliente</label>
                        <input type="text" id="cliente" placeholder="Ej: Banco Continental S.A.">
                    </div>
                    <div>
                        <label>Fecha de Prueba</label>
                        <input type="date" id="fechaPrueba">
                    </div>
                </div>

                <div style="margin-top: 20px;">
                    <label>Ingeniero(s) Responsable(s)</label>
                    <div id="ingenierosContainer"></div>
                    <button class="btn-add" onclick="addIngeniero()">+ AGREGAR INGENIERO</button>
                </div>

                <div style="margin-top: 20px;">
                    <label>Contacto(s) del Cliente</label>
                    <div id="contactosContainer"></div>
                    <button class="btn-add" onclick="addContacto()">+ AGREGAR CONTACTO</button>
                </div>

                <div style="margin-top: 20px;">
                    <label>Ventana de Tiempo para Prueba</label>
                    <input type="text" id="ventanaPrueba" placeholder="Ej: Sábado 22:00 - Domingo 02:00">
                </div>
            </div>

            <!-- CHECKLIST PRE -->
            <div class="section">
                <div class="section-title">✓ CHECKLIST PRE-PRUEBA</div>
                <div class="checklist" id="checklistPre"></div>
            </div>

            <!-- SCOPE -->
            <div class="section">
                <div class="section-title">🎯 ALCANCE DE LA PRUEBA</div>
                <div class="scope-grid">
                    <div class="scope-box scope-include">
                        <div class="scope-title">✓ SÍ SE INCLUYE</div>
                        <textarea id="alcanceSi" rows="6" placeholder="Ejemplo:
- Servidor DC01 (Windows Server 2022)
- VM Ubuntu Web Server
- Carpeta compartida /datos (500GB)
- Base de datos SQL Server"></textarea>
                    </div>
                    <div class="scope-box scope-exclude">
                        <div class="scope-title">✗ NO SE INCLUYE</div>
                        <textarea id="alcanceNo" rows="6" placeholder="Ejemplo:
- Backup completo de toda la infraestructura
- DR total con failover automático
- Migración de servidores
- Pruebas en producción"></textarea>
                    </div>
                </div>
            </div>

            <!-- SYSTEMS -->
            <div class="section">
                <div class="section-title">💻 SISTEMAS A PROTEGER</div>
                <div id="sistemasContainer"></div>
                <button class="btn-add" onclick="addSistema()">+ AGREGAR SISTEMA</button>
            </div>

            <!-- CONFIG -->
            <div class="section">
                <div class="section-title">⚙️ CONFIGURACIÓN IMPLEMENTADA</div>
                <div class="grid-2">
                    <div>
                        <label>Modelo de Appliance Datto</label>
                        <input type="text" id="modeloAppliance" placeholder="Ej: SIRIS 4">
                    </div>
                    <div>
                        <label>Serial del Equipo</label>
                        <input type="text" id="serialEquipo" placeholder="Ej: S4-XXXXXXXX">
                    </div>
                    <div>
                        <label>Agente Instalado</label>
                        <select id="agenteInstalado">
                            <option value="">Seleccionar...</option>
                            <option>Windows Agent</option>
                            <option>Linux Agent</option>
                            <option>Agentless (Hypervisor)</option>
                            <option>Windows + Linux Agent</option>
                        </select>
                    </div>
                    <div>
                        <label>Política de Backup</label>
                        <input type="text" id="politicaBackup" placeholder="Ej: Cada 1 hora / Incremental">
                    </div>
                </div>
            </div>

            <!-- SCENARIOS -->
            <div class="section">
                <div class="section-title">🔄 ESCENARIOS DE RECUPERACIÓN</div>
                <div id="escenariosContainer"></div>
            </div>

            <!-- CHECKLIST DURING -->
            <div class="section">
                <div class="section-title">✓ CHECKLIST DURANTE LA PRUEBA</div>
                <div class="checklist" id="checklistDuring"></div>
            </div>

            <!-- METRICS -->
            <div class="section">
                <div class="section-title">📊 MÉTRICAS OBTENIDAS</div>
                <p style="color: var(--text-dim); font-size: 0.85em; margin-bottom: 15px;">Documentar métricas específicas de cada sistema protegido</p>
                <div id="metricasContainer"></div>
                <button class="btn-add" onclick="addMetrica()">+ AGREGAR SISTEMA</button>
            </div>

            <!-- VALIDATION -->
            <div class="section">
                <div class="section-title">✅ VALIDACIÓN DEL CLIENTE</div>
                <div>
                    <label>¿El cliente validó que los datos recuperados son correctos?</label>
                    <div style="display: flex; gap: 20px; margin-top: 10px;">
                        <label style="display: flex; align-items: center; gap: 8px; text-transform: none;">
                            <input type="radio" name="validacion" value="si" id="validacionSi">
                            <span style="color: var(--success);">✓ SÍ</span>
                        </label>
                        <label style="display: flex; align-items: center; gap: 8px; text-transform: none;">
                            <input type="radio" name="validacion" value="no" id="validacionNo">
                            <span style="color: var(--danger);">✗ NO</span>
                        </label>
                    </div>
                </div>
                <div style="margin-top: 20px;">
                    <label>Comentarios del Cliente</label>
                    <textarea id="comentariosCliente" rows="4" placeholder="Observaciones o feedback del cliente sobre la prueba realizada..."></textarea>
                </div>
            </div>

            <!-- OPPORTUNITIES -->
            <div class="section">
                <div class="section-title">💡 OPORTUNIDADES IDENTIFICADAS</div>
                <textarea id="observaciones" rows="5" placeholder="Ejemplo:
- El cliente no cuenta con respaldo de su base de datos SQL (oportunidad de expansión)
- Se identificaron 3 servidores adicionales sin protección
- El cliente expresó interés en replicación a la nube Datto
- Se requiere capacitación en el uso del portal de administración
- Posibilidad de DR completo con virtualización instantánea"></textarea>
            </div>

            <!-- CHECKLIST POST -->
            <div class="section">
                <div class="section-title">✓ CHECKLIST POST-PRUEBA</div>
                <div class="checklist" id="checklistPost"></div>
            </div>

            <!-- ANNEXES -->
            <div class="section">
                <div class="section-title">📎 ANEXOS TÉCNICOS</div>
                <p style="color: var(--text-dim); font-size: 0.85em; margin-bottom: 15px;">Documentos de soporte detallado (referencia al anexo técnico externo)</p>
                <div class="checklist">
                    <div class="checklist-item">
                        <input type="checkbox" id="anexoA">
                        <label for="anexoA">Anexo A: Capturas de pantalla del proceso de instalación</label>
                    </div>
                    <div class="checklist-item">
                        <input type="checkbox" id="anexoB">
                        <label for="anexoB">Anexo B: Evidencias detalladas de las pruebas de recuperación</label>
                    </div>
                    <div class="checklist-item">
                        <input type="checkbox" id="anexoC">
                        <label for="anexoC">Anexo C: Logs y reportes técnicos del appliance Datto</label>
                    </div>
                    <div class="checklist-item">
                        <input type="checkbox" id="anexoD">
                        <label for="anexoD">Anexo D: Diagrama de infraestructura y topología de red</label>
                    </div>
                </div>
            </div>

            <!-- FOOTER -->
            <div class="section">
                <div class="grid-2">
                    <div>
                        <label>Elaborado por</label>
                        <input type="text" id="elaboradoPor" placeholder="Nombre y firma del ingeniero">
                    </div>
                    <div>
                        <label>Fecha de Elaboración</label>
                        <input type="date" id="fechaElaboracion">
                    </div>
                </div>
            </div>

            <!-- NOTES -->
            <div class="note-box">
                <div class="note-title">⚠️ NOTAS TÉCNICAS</div>
                <ul class="note-list">
                    <li>Documento de uso interno exclusivo del equipo técnico</li>
                    <li>Los datos se guardan automáticamente en el navegador (localStorage)</li>
                    <li>Para crear un nuevo cliente: <code>?client=nombre-empresa</code></li>
                    <li>Para exportar: Usar botón "EXPORT PDF" o Ctrl+P</li>
                    <li>El PDF puede ser archivado en Odoo o sistema de gestión documental</li>
                    <li>Mantener confidencialidad de credenciales y datos sensibles</li>
                </ul>
            </div>
        </div>
    </div>

    <script>
        // Get client ID from URL
        const urlParams = new URLSearchParams(window.location.search);
        const clientId = urlParams.get('client') || 'default';
        document.getElementById('clientDisplay').textContent = clientId;

        // Data structure
        let formData = {
            cliente: '',
            fechaPrueba: '',
            ingenieros: [''],
            contactos: [{ nombre: '', cargo: '', telefono: '', email: '' }],
            ventanaPrueba: '',
            alcanceSi: '',
            alcanceNo: '',
            sistemas: [{ nombre: '', tipo: '', so: '', app: '', capacidad: '', hipervisor: '' }],
            modeloAppliance: '',
            serialEquipo: '',
            agenteInstalado: '',
            politicaBackup: '',
            escenarios: [
                { checked: false, nombre: 'Recuperación de Archivos/Carpetas (Borrado Lógico)', desc: '' },
                { checked: false, nombre: 'Recuperación de Volumen/Partición', desc: '' },
                { checked: false, nombre: 'Virtualización Instantánea (Bare Metal Recovery)', desc: '' },
                { checked: false, nombre: 'Exportación de VM (.VHDX/.VMDK)', desc: '' },
                { checked: false, nombre: 'BMR en Hardware Diferente (Disociación de Drivers)', desc: '' }
            ],
            metricas: [{ sistema: '', rto_obj: '', rto_res: '', rto_st: '', rpo_obj: '', rpo_res: '', rpo_st: '', int_res: '', int_st: '' }],
            validacion: '',
            comentariosCliente: '',
            observaciones: '',
            checklistPre: {},
            checklistDuring: {},
            checklistPost: {}
        };

        // Checklist data
        const checklistPreItems = [
            'Coordinación de fecha y hora confirmada con el cliente',
            'Accesos remotos validados (RDP/SSH/VPN)',
            'Credenciales de administrador recibidas y validadas',
            'Appliance Datto registrado y operativo',
            'Conectividad de red validada (LAN/VLAN)',
            'Información del sistema a proteger documentada',
            'Ventana de mantenimiento autorizada por el cliente'
        ];

        const checklistDuringItems = [
            'Backup inicial completado exitosamente',
            'Puntos de recuperación creados y verificados',
            'Escenario(s) de recuperación ejecutado(s)',
            'Datos restaurados validados por el cliente',
            'Screenshots y evidencias capturadas',
            'Tiempos de recuperación documentados',
            'Sistema productivo no afectado'
        ];

        const checklistPostItems = [
            'Sistema productivo restaurado a su estado original',
            'Anexo técnico con evidencias completado',
            'Métricas documentadas y validadas',
            'Conformidad del cliente obtenida',
            'Reporte ejecutivo preparado para envío',
            'Oportunidades comerciales identificadas y reportadas'
        ];

        // Load data
        function loadData() {
            const saved = localStorage.getItem(`datto-pilot-${clientId}`);
            if (saved) {
                try {
                    formData = JSON.parse(saved);
                } catch (e) {
                    console.error('Error loading data:', e);
                }
            }
        }

        // Save data
        function saveData() {
            localStorage.setItem(`datto-pilot-${clientId}`, JSON.stringify(formData));
        }

        // Render ingenieros
        function renderIngenieros() {
            const container = document.getElementById('ingenierosContainer');
            container.innerHTML = '';
            formData.ingenieros.forEach((ing, idx) => {
                const div = document.createElement('div');
                div.style.cssText = 'display: flex; gap: 10px; margin-bottom: 10px;';
                div.innerHTML = `
                    <input type="text" value="${ing}" placeholder="Ej: Juan Pérez - Ingeniero Senior" 
                        onchange="formData.ingenieros[${idx}] = this.value; saveData();" 
                        style="flex: 1;">
                    ${formData.ingenieros.length > 1 ? 
                        `<button class="btn-remove" onclick="removeIngeniero(${idx})">✕</button>` : ''}
                `;
                container.appendChild(div);
            });
        }

        function addIngeniero() {
            formData.ingenieros.push('');
            renderIngenieros();
            saveData();
        }

        function removeIngeniero(idx) {
            formData.ingenieros.splice(idx, 1);
            renderIngenieros();
            saveData();
        }

        // Render contactos
        function renderContactos() {
            const container = document.getElementById('contactosContainer');
            container.innerHTML = '';
            formData.contactos.forEach((c, idx) => {
                const div = document.createElement('div');
                div.className = 'dynamic-item';
                div.innerHTML = `
                    <div class="dynamic-item-header">
                        <span class="dynamic-item-title">CONTACTO #${idx + 1}</span>
                        ${formData.contactos.length > 1 ? 
                            `<button class="btn-remove" onclick="removeContacto(${idx})">✕ ELIMINAR</button>` : ''}
                    </div>
                    <div class="grid-4">
                        <div>
                            <input type="text" value="${c.nombre}" placeholder="Nombre completo"
                                onchange="formData.contactos[${idx}].
