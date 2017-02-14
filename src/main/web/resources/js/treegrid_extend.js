$.extend($.fn.treegrid.methods, {
    clientPaging: function(jq){
        return jq.each(function(){
            var tg = $(this);
            var state = tg.data('treegrid');
            var opts = state.options;
            opts.loadFilter = pagerFilter;
            var onBeforeLoad = opts.onBeforeLoad;
            opts.onBeforeLoad = function(row,param){
                state.allRows = null;
                return onBeforeLoad.call(this, row, param);
            }
            var pager = tg.treegrid('getPager');
            pager.pagination({
                onSelectPage:function(pageNum, pageSize){
                    opts.pageNumber = pageNum;
                    opts.pageSize = pageSize;
                    pager.pagination('refresh',{
                        pageNumber:pageNum,
                        pageSize:pageSize
                    });
                    tg.treegrid('loadData',state.allRows);
                }
            });
            tg.treegrid('loadData', state.data);
            if (opts.url){
                tg.treegrid('reload');
            }
        });
    },
    loadData: function(jq, data){
        jq.each(function(){
            $(this).data('treegrid').allRows = null;
        });
        return loadDataMethod.call($.fn.treegrid.methods, jq, data);
    },
    append: function(jq, param){
        return jq.each(function(){
            var state = $(this).data('treegrid');
            if (state.options.loadFilter == pagerFilter){
                $.map(param.data, function(row){
                    row._parentId = row._parentId || param.parent;
                    state.allRows.push(row);
                });
                $(this).treegrid('loadData', state.allRows);
            } else {
                appendMethod.call($.fn.treegrid.methods, $(this), param);
            }
        })
    },
    remove: function(jq, id){
        return jq.each(function(){
            if ($(this).treegrid('find', id)){
                removeMethod.call($.fn.treegrid.methods, $(this), id);
            }
            var state = $(this).data('treegrid');
            if (state.options.loadFilter == pagerFilter){
                for(var i=0; i<state.allRows.length; i++){
                    if (state.allRows[i][state.options.idField] == id){
                        state.allRows.splice(i,1);
                        break;
                    }
                }
                $(this).treegrid('loadData', state.allRows);
            }
        })
    },
    getAllRows: function(jq){
        return jq.data('treegrid').allRows;
    }
});