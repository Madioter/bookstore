package com.madiot.bookstore.common;

/**
 * Created by Yi.Wang2 on 2017/2/14.
 */
public class DictionaryHolder {
    private static DictionaryHolder ourInstance = new DictionaryHolder();

    public static DictionaryHolder getInstance() {
        return ourInstance;
    }

    private DictionaryHolder() {
    }
}
