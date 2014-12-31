import com.meerkat.Decision
import com.meerkat.Geo
import com.meerkat.SearchService
import com.meerkat.Signer
import com.meerkat.Type
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
        geoIndex()
        decIndex()
        signerIndex()
        typeIndex()
    }
    def destroy = {
    }
    def geoIndex(){
        //        indexing geo for custom lucene search
        Analyzer analyzer = new GreekAnalyzer(Version.LUCENE_4_10_2);
        File fsdFile=new File("geoindex")
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
                doc.add(new Field("prototype", g.namegrk, TextField.TYPE_STORED));
                doc.add(new Field("stemed", nmgrk, TextField.TYPE_STORED));
                iwriter.addDocument(doc);
            }
            iwriter.close();
            directory.close()
            println "Finished Indexing geos ..."
        }
    }
    def decIndex(){
        //        indexing decision for custom lucene search
        Analyzer analyzer = new GreekAnalyzer(Version.LUCENE_4_10_2);
        File fsdFile=new File("decindex")
        if(!fsdFile.exists()) {
            println "Indexing decisions ..."
            Directory directory = FSDirectory.open(fsdFile);
            IndexWriterConfig config = new IndexWriterConfig(Version.LUCENE_4_10_2, analyzer);
            IndexWriter iwriter = new IndexWriter(directory, config);
            GreekStemmer stemmer = new GreekStemmer()
            def decs = Decision.findAll()
            decs.each { g ->
                if(g.subject){
                    Document doc = new Document();
                    String text = SearchService.StemFilter(g.subject)
                    def search_strings = text.split(' ')
                    String subj = ""
                    search_strings.each { param ->
                        char[] char_array = param.toCharArray()
                        int param_stem = stemmer.stem(char_array, char_array.length)
                        char_array = char_array[0..param_stem - 1]
                        subj = subj + char_array.toString() + " "
                    }
                    doc.add(new Field("prototype", g.ada+" "+g.versionId, TextField.TYPE_STORED));
                    doc.add(new Field("stemed", subj, TextField.TYPE_STORED));
                    iwriter.addDocument(doc);
                }
            }
            iwriter.close();
            directory.close()
            println "Finished Indexing decisions ..."
        }
    }
    def signerIndex(){
        //        indexing decision for custom lucene search
        Analyzer analyzer = new GreekAnalyzer(Version.LUCENE_4_10_2);
        File fsdFile=new File("signerindex")
        if(!fsdFile.exists()) {
            println "Indexing signers ..."
            Directory directory = FSDirectory.open(fsdFile);
            IndexWriterConfig config = new IndexWriterConfig(Version.LUCENE_4_10_2, analyzer);
            IndexWriter iwriter = new IndexWriter(directory, config);
            GreekStemmer stemmer = new GreekStemmer()
            def decs = Signer.findAll()
            decs.each { g ->
                    Document doc = new Document();
                    String text = SearchService.StemFilter(g.firstName+" "+g.lastName)
                    def search_strings = text.split(' ')
                    String subj = ""
                    search_strings.each { param ->
                        char[] char_array = param.toCharArray()
                        int param_stem = stemmer.stem(char_array, char_array.length)
                        char_array = char_array[0..param_stem - 1]
                        subj = subj + char_array.toString() + " "
                    }
                    doc.add(new Field("prototype", g.firstName+" "+g.lastName, TextField.TYPE_STORED));
                    doc.add(new Field("stemed", subj, TextField.TYPE_STORED));
                    iwriter.addDocument(doc);
                }
            iwriter.close();
            directory.close()
            println "Finished Indexing signers ..."
        }
    }
    def typeIndex(){
        //        indexing types for custom lucene search
        Analyzer analyzer = new GreekAnalyzer(Version.LUCENE_4_10_2);
        File fsdFile=new File("typeindex")
        if(!fsdFile.exists()) {
            println "Indexing types ..."
            Directory directory = FSDirectory.open(fsdFile);
            IndexWriterConfig config = new IndexWriterConfig(Version.LUCENE_4_10_2, analyzer);
            IndexWriter iwriter = new IndexWriter(directory, config);
            GreekStemmer stemmer = new GreekStemmer()
            def decs = Type.findAll()
            decs.each { g ->
                Document doc = new Document();
                String text = SearchService.StemFilter(g.label)
                def search_strings = text.split(' ')
                String subj = ""
                search_strings.each { param ->
                    char[] char_array = param.toCharArray()
                    int param_stem = stemmer.stem(char_array, char_array.length)
                    char_array = char_array[0..param_stem - 1]
                    subj = subj + char_array.toString() + " "
                }
                doc.add(new Field("prototype", g.label, TextField.TYPE_STORED));
                doc.add(new Field("stemed", subj, TextField.TYPE_STORED));
                iwriter.addDocument(doc);
            }
            iwriter.close();
            directory.close()
            println "Finished Indexing types ..."
        }
    }
}
