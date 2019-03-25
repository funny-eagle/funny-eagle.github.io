import React from 'react'
import 'whatwg-fetch'

class Dashboard extends React.Component {

    constructor(props){
        super(props);
        this.state = {
            pageNum: 1,
            totalPages: 0,
            archives:[]
        }
    }

    componentDidMount(){
        this.getArchives(this.state.pageNum);
    }

    nextPage(e){
        e.preventDefault();
        var totalPages = this.state.totalPages;
        var currentPage = this.state.pageNum;
        var nextPageNum = (currentPage < totalPages) ?  (currentPage + 1) : totalPages;
        this.setState({pageNum: nextPageNum});
        this.getArchives(nextPageNum);
    }

    prevPage(e){
        e.preventDefault();
        var currentPage = this.state.pageNum;
        var prevPageNum = (currentPage != 1) ?  (currentPage - 1) : currentPage;
        this.setState({pageNum: prevPageNum});
        this.getArchives(prevPageNum);
    }

    getArchives(pageNum){
        fetch('http://nocoder.org:8000/archives/' + pageNum)
            .then((response)=>response.json())
            .then(res=>{
                this.setState({archives: res.data.archives, totalPages:res.data.totalPages});
            });
    }

    handleClick(e, archiveId){
        e.preventDefault();
        console.log("archive id=" + archiveId);
    }

    render(){
        const archives = this.state.archives;
        return <div>
                    <ul>
                        {archives.map((archive, index) => {
                                return <li key={index}>
                                            <a href="#" onClick={(e) => {this.handleClick(e, archive.id)}}>{archive.title}</a>
                                            <span> {archive.createTime}</span>
                                        </li>

                        })}
                    </ul>

                    <div> 
                        <a href="#" onClick={(e) => {this.prevPage(e)}}>上一页</a>
                        &nbsp;&nbsp;
                        <a href="#" onClick={(e) => {this.nextPage(e)}}>下一页</a>
                        &nbsp;&nbsp;
                        <span>第{this.state.pageNum}页</span>
                        &nbsp;&nbsp;
                        <span>共{this.state.totalPages}页</span>
                    </div>
                </div>
    }

}

export default Dashboard

