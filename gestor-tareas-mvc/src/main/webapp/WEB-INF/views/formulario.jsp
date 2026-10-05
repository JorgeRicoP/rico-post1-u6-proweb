<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Nueva tarea</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/estilos.css">
</head>
<body>
    <h1>Nueva tarea</h1>
    <c:if test="${not empty error}">
        <p class="error">${error}</p>
    </c:if>
    <form method="post" action="${pageContext.request.contextPath}/app" novalidate>
        <input type="hidden" name="comando" value="guardar">

        <label>Título:
            <input type="text" name="titulo" value="<c:out value='${titulo}'/>">
            <c:if test="${not empty errores.titulo}">
                <span class="error">${errores.titulo}</span>
            </c:if>
        </label>

        <label>Categoría:
            <input type="text" name="categoria" value="<c:out value='${categoria}'/>">
            <c:if test="${not empty errores.categoria}">
                <span class="error">${errores.categoria}</span>
            </c:if>
        </label>

        <label>Prioridad:
            <select name="prioridad">
                <option value="Alta"  ${prioridad == 'Alta'  ? 'selected' : ''}>Alta</option>
                <option value="Media" ${empty prioridad or prioridad == 'Media' ? 'selected' : ''}>Media</option>
                <option value="Baja"  ${prioridad == 'Baja'  ? 'selected' : ''}>Baja</option>
            </select>
            <c:if test="${not empty errores.prioridad}">
                <span class="error">${errores.prioridad}</span>
            </c:if>
        </label>

        <label>Fecha límite (yyyy-MM-dd):
            <input type="text" name="fechaLimite" placeholder="2026-12-20"
                   value="<c:out value='${fechaLimite}'/>">
            <c:if test="${not empty errores.fechaLimite}">
                <span class="error">${errores.fechaLimite}</span>
            </c:if>
        </label>

        <button type="submit">Guardar</button>
        <a href="${pageContext.request.contextPath}/app">Cancelar</a>
    </form>
</body>
</html>