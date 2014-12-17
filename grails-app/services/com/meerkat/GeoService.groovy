package com.meerkat

import grails.transaction.Transactional

@Transactional
class GeoService {

    /*
     Returns the points of interest near a point on map (identified by
     latitude and longitude).
     parameters: double centerLat,double centerLon,double radius
     return: List retPois
      */
    def findPOINearLatLng(double centerLat,double centerLon,double radius){
        def retPois=[]
        def pois=Geo.getAll()
        pois.each{poi->
            if(calculateDistance(poi.latitude,poi.longitude,centerLat,centerLon)<radius){
                retPois.add(poi)
            }
        }
        return retPois
    }

    /*
    Formula for calculating distance using lat,lng
    http://www.movable-type.co.uk/scripts/latlong.html
    parameters: double lat1 double lon1 double lat2 double lon2
    return: double distance
     */
    double calculateDistance(double lat1,double lon1,double lat2,double lon2){
        def R = 6371; // km
        def φ1 = lat1.toRadians();
        def φ2 = lat2.toRadians();
        def Δφ = (lat2-lat1).toRadians();
        def Δλ = (lon2-lon1).toRadians();

        def a = Math.sin(Δφ/2) * Math.sin(Δφ/2) +
                Math.cos(φ1) * Math.cos(φ2) *
                Math.sin(Δλ/2) * Math.sin(Δλ/2);
        def c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));

        def d = R * c;
        return d
    }
}
