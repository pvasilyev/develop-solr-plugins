package com.github.pvasilyev.solr.plugins;

import org.apache.solr.core.PluginInfo;
import org.apache.solr.handler.component.SearchHandler;
import org.apache.solr.request.SolrQueryRequest;
import org.apache.solr.response.SolrQueryResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.lang.invoke.MethodHandles;

/**
 * @author pvasilyev
 * @since 10/5/16
 */
public class CustomSearchHandler extends SearchHandler {

    private static final Logger LOG = LoggerFactory.getLogger(MethodHandles.lookup().lookupClass());

    private String message;

    @Override
    public void init(final PluginInfo info) {
        super.init(info);
        this.message = (String )info.initArgs.get("custom.property.one.can.read.from.named.list");
    }

    @Override
    public void handleRequestBody(final SolrQueryRequest solrQueryRequest,
                                  final SolrQueryResponse solrQueryResponse) throws Exception {
        LOG.info(message);
        super.handleRequestBody(solrQueryRequest, solrQueryResponse);
    }

    @Override
    public String getDescription() {
        return "Custom search handler for Demo purposes";
    }
}
