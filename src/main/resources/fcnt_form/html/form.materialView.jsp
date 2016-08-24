<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<template:addResources type="javascript" resources="lib/_ffct.js"/>
<template:addResources type="css" resources="lib/_ffct.css"/>
<script>
    (function() {
        angular.module('formFactory').requires.push('ngMaterial');
        angular.module('formFactory').requires.push('ngMessages');
        angular.module('formFactory').config(function ($mdThemingProvider) {
            $mdThemingProvider.theme('blue-theme', 'default')
                    .primaryPalette('light-blue',
                            {'default': 'A400'})
        });
    })();
</script>
