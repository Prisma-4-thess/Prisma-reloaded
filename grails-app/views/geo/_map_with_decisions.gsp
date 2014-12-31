%{--This template shows a map with a specified center and all given decisions as markers--}%
%{--parameters: mapCenter, decisionList--}%

<%@ page import="com.meerkat.Geo" contentType="text/html;charset=UTF-8" %>
%{--<head>--}%
    %{--<meta name="layout" content="main_layout"/>--}%
    %{--<title>OpenLayers 3 Example</title>--}%
    %{--<link rel="stylesheet" href="http://openlayers.org/en/v3.0.0/css/ol.css" type="text/css"/>--}%
    %{--<style type="text/css">--}%
    %{--.ol-popup {--}%
        %{--display: none;--}%
        %{--position: absolute;--}%
        %{--background-color: rgba(255, 255, 255, 0.7);--}%
        %{---moz-box-shadow: 0 1px 4px rgba(0, 0, 0, 0.2);--}%
        %{--padding: 15px;--}%
        %{--border-radius: 10px;--}%
        %{--border: 1px solid #cccccc;--}%
        %{--bottom: 12px;--}%
        %{--left: -50px;--}%
    %{--}--}%

    %{--.ol-popup:after, .ol-popup:before {--}%
        %{--top: 100%;--}%
        %{--border: solid transparent;--}%
        %{--content: " ";--}%
        %{--height: 0;--}%
        %{--width: 0;--}%
        %{--position: absolute;--}%
        %{--pointer-events: none;--}%
    %{--}--}%

    %{--.ol-popup:after {--}%
        %{--border-top-color: white;--}%
        %{--border-width: 10px;--}%
        %{--left: 48px;--}%
        %{--margin-left: -10px;--}%
    %{--}--}%

    %{--.ol-popup:before {--}%
        %{--border-top-color: #cccccc;--}%
        %{--border-width: 11px;--}%
        %{--left: 48px;--}%
        %{--margin-left: -11px;--}%
    %{--}--}%

    %{--.ol-popup-closer {--}%
        %{--text-decoration: none;--}%
        %{--position: absolute;--}%
        %{--top: 2px;--}%
        %{--right: 8px;--}%
    %{--}--}%

    %{--.ol-popup-closer:after {--}%
        %{--content: "✖";--}%
    %{--}--}%

    %{--.map {--}%
        %{--height: 100%;--}%
        %{--width: 100%;--}%
    %{--}--}%
    %{--</style>--}%
    %{--<script src="http://openlayers.org/en/v3.0.0/build/ol.js" type="text/javascript"></script>--}%
%{--</head>--}%

<div id="map-canvas" class="mapWithDec">
    <div id="popup" class="ol-popup">
        <div id="popup-content"></div>
    </div>
</div>