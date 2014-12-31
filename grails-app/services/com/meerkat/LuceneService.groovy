package com.meerkat

import grails.transaction.Transactional
import org.apache.lucene.analysis.Analyzer
import org.apache.lucene.analysis.el.GreekAnalyzer
import org.apache.lucene.document.Document
import org.apache.lucene.index.DirectoryReader
import org.apache.lucene.queryparser.classic.QueryParser
import org.apache.lucene.search.IndexSearcher
import org.apache.lucene.search.Query
import org.apache.lucene.search.ScoreDoc
import org.apache.lucene.store.Directory
import org.apache.lucene.store.FSDirectory

@Transactional
class LuceneService {

    static def decision2geo(float score) {
        def decisions=Decision.all
        decisions.each { d ->
            if (d.subject) {
                def subject = SearchService.Stem(d.subject)
                def retList = indexSearch(subject, "/tmp/geoindex", score)
                if(retList){
                    def geo=Geo.findByNamegrk(retList.get(0).prototype)
                    if(!geo.decisions.contains(d)){
                        geo.addToDecisions(d)
                    }
                }
            }
        }
    }
    static def indexSearch(String param,String index_directory,float score){
        def returnList=[]
        Analyzer analyzer=new GreekAnalyzer()
        File fsdFile=new File(index_directory)
        Directory directory = FSDirectory.open(fsdFile);
        DirectoryReader ireader = DirectoryReader.open(directory);
        IndexSearcher isearcher = new IndexSearcher(ireader);
        // Parse a simple query that searches for "text":
        QueryParser parser = new QueryParser("stemed", analyzer);
        Query query = parser.parse(param)
        ScoreDoc[] hits = isearcher.search(query, null, 100).scoreDocs;
//        println hits.toString()
        // Iterate through the results:
        for (int i = 0; i < hits.length; i++) {
            if(hits[i].score>score){
                Document hitDoc = isearcher.doc(hits[i].doc);
                def map=[prototype:hitDoc.get("prototype"),score:hits[i].score]
                returnList.add(map)
            }
        }
        ireader.close();
        directory.close()
        return returnList
    }
}
