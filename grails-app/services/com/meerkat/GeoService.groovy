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

    static def findPOINearLatLng(double centerLat, double centerLon, double radius, int max ) { //TODO: Use max parameter to return the results from closest to furthest
        def retPois = []
        def retGeos= []
        def pois = Geo.getAll()
        pois.each { poi ->
            def dist=calculateDistance(poi.latitude, poi.longitude, centerLat, centerLon)
            if (dist < radius) {
                def map=[namegrk:poi.namegrk,lat:poi.latitude,lng:poi.longitude,distance:dist]
                retPois.add(map)
            }
        }
        println(retPois)
        retPois=retPois.sort{it.distance}
        if(retPois.size()<max){
            retPois[0..retPois.size()-1].each {r->
                def g=Geo.findByLatitudeAndLongitudeAndNamegrk(r.lat,r.lng,r.namegrk)
                retGeos.add(g)
            }
        }else {
            retPois[0..max-1].each {r->
                def g=Geo.findByLatitudeAndLongitudeAndNamegrk(r.lat,r.lng,r.namegrk)
                retGeos.add(g)
            }
        }
//        println(retGeos)
        return retGeos
    }

    /*
    Formula for calculating distance using lat,lng
    http://www.movable-type.co.uk/scripts/latlong.html
    parameters: double lat1 double lon1 double lat2 double lon2
    return: double distance
     */

    static double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
        def R = 6371; // km
        def φ1 = Math.toRadians(lat1);
        def φ2 = Math.toRadians(lat2);
        def Δφ = Math.toRadians(lat2 - lat1);
        def Δλ = Math.toRadians(lon2 - lon1);

        def a = Math.sin(Δφ / 2) * Math.sin(Δφ / 2) +
                Math.cos(φ1) * Math.cos(φ2) *
                Math.sin(Δλ / 2) * Math.sin(Δλ / 2);
        def c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));

        def d = R * c;
        return d
    }

    static def addDecisionToGeo(double lat,double lng,String namegrk,Decision decision){
        Geo geo=Geo.findByLatitudeAndLongitudeAndNamegrk(lat,lng,namegrk)
        if(!geo){
            geo.addToDecisions(decision)
        }else {
            try{
                geo.save(flush: true,failOnError: true)
                geo.addToDecisions(decision)
                return [response:"success"]
            }catch (Exception e){
                println("Failed to save new geo")
                return [response:"fail"]
            }
        }
    }
}
