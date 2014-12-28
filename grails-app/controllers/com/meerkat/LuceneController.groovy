package com.meerkat

class LuceneController {

    def index() {
        float score=0.4
        LuceneService.decision2geo(score)
    }
}
