package com.meerkat

class ContactController {
    def index() {}
    def test(){
        String s="λευκου"
        DecisionService.search(s.toCharArray())
    }
}
