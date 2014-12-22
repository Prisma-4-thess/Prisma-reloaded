import com.meerkat.Geo
import com.meerkat.SearchService
import org.apache.lucene.analysis.Analyzer
import org.apache.lucene.analysis.el.GreekAnalyzer
import org.apache.lucene.analysis.el.GreekStemmer
import org.apache.lucene.document.Document
import org.apache.lucene.document.Field
import org.apache.lucene.document.TextField
import org.apache.lucene.index.IndexWriter
import org.apache.lucene.index.IndexWriterConfig
import org.apache.lucene.store.Directory
import org.apache.lucene.store.FSDirectory
import org.apache.lucene.util.Version

class BootStrap {
    def init = { servletContext ->
//        indexing geo for custom lucene search
        Analyzer analyzer = new GreekAnalyzer(Version.LUCENE_4_10_2);
        File fsdFile=new File("/tmp/geoindex")
        if(!fsdFile.exists()) {
            println "Indexing geos ..."
            Directory directory = FSDirectory.open(fsdFile);
            IndexWriterConfig config = new IndexWriterConfig(Version.LUCENE_4_10_2, analyzer);
            IndexWriter iwriter = new IndexWriter(directory, config);
            GreekStemmer stemmer = new GreekStemmer()
            def geos = Geo.all
            geos.each { g ->
                Document doc = new Document();
                String text = SearchService.StemFilter(g.namegrk)
                def search_strings = text.split(' ')
                String nmgrk = ""
                search_strings.each { param ->
                    char[] char_array = param.toCharArray()
                    int param_stem = stemmer.stem(char_array, char_array.length)
                    char_array = char_array[0..param_stem - 1]
                    nmgrk = nmgrk + char_array.toString() + " "
                }
                doc.add(new Field("namegrk", g.namegrk, TextField.TYPE_STORED));
                doc.add(new Field("stemed_namegrk", nmgrk, TextField.TYPE_STORED));
                iwriter.addDocument(doc);
            }
            iwriter.close();
            directory.close()
            println "Finished Indexing geos ..."
        }
    }
    def destroy = {
    }
}
