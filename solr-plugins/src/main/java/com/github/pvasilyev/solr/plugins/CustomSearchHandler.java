package com.github.pvasilyev.solr.plugins;

import org.apache.solr.handler.RequestHandlerBase;
import org.apache.solr.request.SolrQueryRequest;
import org.apache.solr.response.SolrQueryResponse;

/**
 * @author pvasilyev
 * @since 10/5/16
 */
public class CustomSearchHandler extends RequestHandlerBase {

    @Override
    public void handleRequestBody(final SolrQueryRequest solrQueryRequest,
                                  final SolrQueryResponse solrQueryResponse) throws Exception {

    }

    @Override
    public String getDescription() {
        return null;
    }
}
