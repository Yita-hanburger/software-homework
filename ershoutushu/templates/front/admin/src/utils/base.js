const base = {
    get() {
        return {
            url : "http://localhost:8080/ershoutushu/",
            name: "ershoutushu",
            // 退出到首页链接
            indexUrl: 'http://localhost:8080/front/h5/index.html'
        };
    },
    getProjectName(){
        return {
            projectName: "基于微信程序的校园二手图书交易系统"
        } 
    }
}
export default base
