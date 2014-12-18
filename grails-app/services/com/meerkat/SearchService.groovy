package com.meerkat

import grails.transaction.Transactional
import org.apache.lucene.analysis.el.GreekStemmer
@Transactional
class SearchService {

    /**
     * Feature for the search bar. Search for pois in the db that matches with the text given.
     * Greek stemmer by Georgios Ntais - Development of a Stemmer for the Greek Language
     * @param search_param
     * @param par_max
     * @param par_offset
     * @param sort
     * @param orderList
     * @return
     */
    static def searchForPOI(String search_param,int par_max,int par_offset,String sort,String orderList){
        GreekStemmer stemmer=new GreekStemmer()
        String nmgrk=""
        def search_strings=search_param.split(' ')
        search_strings.each {param->
            char[] char_array=param.toCharArray()
            int param_stem=stemmer.stem(char_array,char_array.length)
            char_array=char_array[0..param_stem-1]
            nmgrk=nmgrk+char_array.toString()+"% "
        }
        def pois=Geo.createCriteria().list(max: par_max, offset: par_offset){
            like("namegrk",nmgrk)
        }
        return pois
    }
}
