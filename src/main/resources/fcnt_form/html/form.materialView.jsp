<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<template:addResources type="javascript" resources="aria.js"/>
<template:addResources type="javascript" resources="messages.js"/>
<template:addResources type="javascript" resources="angular-material.js"/>
<template:addResources type="css" resources="angular-material.css"/>
<script>
    angular.module('formFactory').requires.push('ngMaterial');
    angular.module('formFactory').requires.push('ngMessages');
    angular.module('formFactory').config(function ($mdThemingProvider) {
        // Configure a dark theme with primary foreground yellow
        $mdThemingProvider.theme('docs-dark', 'default')
                .primaryPalette('yellow')
                .dark();
    });
</script>
