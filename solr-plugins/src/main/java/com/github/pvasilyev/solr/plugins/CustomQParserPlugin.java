package com.github.pvasilyev.solr.plugins;

import org.apache.lucene.index.Term;
import org.apache.lucene.search.PrefixQuery;
import org.apache.lucene.search.Query;
import org.apache.solr.common.params.SolrParams;
import org.apache.solr.common.util.NamedList;
import org.apache.solr.request.SolrQueryRequest;
import org.apache.solr.search.QParser;
import org.apache.solr.search.QParserPlugin;
import org.apache.solr.search.SyntaxError;

/**
 * @author pvasilyev
 * @since 10/5/16
 */
public class CustomQParserPlugin extends QParserPlugin {

    @Override
    public QParser createParser(final String s, final SolrParams solrParams, final SolrParams solrParams1,
                                final SolrQueryRequest solrQueryRequest) {
        return new CustomQParser(s, solrParams, solrParams1, solrQueryRequest);
    }

    @Override
    public void init(final NamedList namedList) {

    }

    private class CustomQParser extends QParser {

        public CustomQParser(final String qstr, final SolrParams localParams, final SolrParams params,
                             final SolrQueryRequest req) {
            super(qstr, localParams, params, req);
        }

        @Override
        public Query parse() throws SyntaxError {
            final Term term = new Term("clientName_s", qstr);
            return new PrefixQuery(term);
        }
    }

}
