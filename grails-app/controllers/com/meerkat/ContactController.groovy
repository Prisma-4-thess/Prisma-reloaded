package com.meerkat

class ContactController {
    def index() {}

    def test() {
        String s = "λευκού πύργου"
        SearchService.searchForPOI(s)
    }
}
