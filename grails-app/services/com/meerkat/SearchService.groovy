package com.meerkat

import grails.transaction.Transactional
import org.apache.lucene.analysis.Analyzer
import org.apache.lucene.analysis.TokenStream
import org.apache.lucene.analysis.el.GreekAnalyzer
import org.apache.lucene.analysis.el.GreekLowerCaseFilter
import org.apache.lucene.analysis.el.GreekStemmer
import org.apache.lucene.analysis.tokenattributes.CharTermAttribute
import org.apache.lucene.document.Document
import org.apache.lucene.index.DirectoryReader
import org.apache.lucene.queryparser.classic.QueryParser
import org.apache.lucene.search.IndexSearcher
import org.apache.lucene.search.Query
import org.apache.lucene.search.ScoreDoc
import org.apache.lucene.store.Directory
import org.apache.lucene.store.FSDirectory
import org.apache.lucene.util.Version




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
        def returnPOI=[]
        def nmgrk=Stem(search_param)
        def pois=indexSearch(nmgrk,"./geoindex")
        def totalNumOfRes=pois.size()
        if(pois.size()>0) {
            if (pois.size() < par_offset + par_max - 1) {
                pois = pois[par_offset..pois.size() - 1]
            } else {
                pois = pois[par_offset..par_offset + par_max - 1]
            }
            pois.each { poi ->
                returnPOI.add(Geo.findByNamegrk(poi))
            }
        }
        return [list: returnPOI,totalNumOfRes: totalNumOfRes]
    }

    static def searchForDecisions(String search_param,int par_max,int par_offset,String sort,String orderList){
        def returnDEC=[]
        def subject=Stem(search_param)
        def dec=indexSearch(subject,"./decindex")
        def totalNumOfRes=dec.size()
        if(dec.size()>0) {
            if (dec.size() < par_offset + par_max - 1) {
                dec = dec[par_offset..dec.size() - 1]
            } else {
                dec = dec[par_offset..par_offset + par_max - 1]
            }

            dec.each { s ->
                def decision = Decision.findByAdaAndVersionId(s.toString().split(' ')[0], s.toString().split(' ')[1])
                returnDEC.add(decision)
            }
        }
        return [list:returnDEC,totalNumOfRes:totalNumOfRes]
    }

    static def searchForSigners(String search_param,int par_max,int par_offset,String sort,String orderList){
        def returnSIGN=[]
        def subject=Stem(search_param)
        def signer=indexSearch(subject,"./signerindex")
        def totalNumOfRes=signer.size()
        if(signer.size()>0) {
            if (signer.size() < par_offset + par_max - 1) {
                signer = dec[par_offset..signer.size() - 1]
            } else {
                signer = signer[par_offset..par_offset + par_max - 1]
            }

            signer.each { s ->
                def signerInstance = Signer.findByFirstNameAndLastName(s.toString().split(' ')[0], s.toString().split(' ')[1])
                if (signerInstance) {
                    returnSIGN.add(signerInstance)
                }
            }
        }
        return [list: returnSIGN,totalNumOfRes: totalNumOfRes]
    }

    static def searchForTypes(String search_param,int par_max,int par_offset,String sort,String orderList){
        def returnTYPE=[]
        def subject=Stem(search_param)
        def type=indexSearch(subject,"./typeindex")
        type.each {s->
            def decision=Type.findByLabel(s.toString())
            returnTYPE.add(decision)
        }
        return returnTYPE
    }

    static def indexSearch(String param,String index_directory){
        def returnList=[]
        Analyzer analyzer=new GreekAnalyzer()
        File fsdFile=new File(index_directory)
        Directory directory = FSDirectory.open(fsdFile);
        DirectoryReader ireader = DirectoryReader.open(directory);
        IndexSearcher isearcher = new IndexSearcher(ireader);
        // Parse a simple query that searches for "text":
        QueryParser parser = new QueryParser("stemed", analyzer);
        Query query = parser.parse(param)
        ScoreDoc[] hits = isearcher.search(query, null, 50).scoreDocs;
        println hits.toString()
        // Iterate through the results:
        for (int i = 0; i < hits.length; i++) {
            Document hitDoc = isearcher.doc(hits[i].doc);
            returnList.add(hitDoc.get("prototype"));
        }
        ireader.close();
        directory.close()
        return returnList
    }

    static String Stem(String search_param){
        GreekStemmer stemmer=new GreekStemmer()
        search_param=StemFilter(search_param)
        String nmgrk=""
        def search_strings=search_param.split(' ')
        search_strings.each {param->
            char[] char_array=param.toCharArray()

            int param_stem=stemmer.stem(char_array,char_array.length)
            char_array=char_array[0..param_stem-1]
            nmgrk=nmgrk+char_array.toString()+" "
        }
        return nmgrk
    }

    static String StemFilter(String param) throws Exception {
        String filteredText=""
        Analyzer analyzer = new GreekAnalyzer(Version.LUCENE_4_10_2);
        TokenStream input=analyzer.tokenStream("search",new StringReader(param))
        CharTermAttribute termAtt = input.addAttribute(CharTermAttribute.class);
        GreekLowerCaseFilter filter=new GreekLowerCaseFilter(input)
        filter.reset()
        while (filter.incrementToken()){
            filteredText=filteredText+termAtt.toString()+" "
        }
        return filteredText
    }
}
