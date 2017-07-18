class QAButton extends React.Component {
    constructor(props) {
        super();
        this.state = {
            is_hidden: {dispaly: 'block'}
        };
        this.handleClick = this.handleClick.bind(this);
    }

    componentDidMount() {
    }

    componentWillUnmount() {
    }

    handleClick(e) {
        e.preventDefault();
        myObject = this;
        $.ajax({
            url: '/get_question',
            type: "GET",
            dataType: "json",
            data: { id: this.props.question_id }, // This goes to Controller in params hash, i.e. params[:id]
            complete: function() {},
            success: function(data) {
                //question_content, answer_content - это название ответного поля в json-е (см. ответ контроллера)
                showModal(data.question_content,
                          data.answer_content,
                          myObject.props.btn_id,
                          myObject.props.question_id);
                myObject.setState({is_hidden: {display: 'none'}});
            },
            error: function() {
                alert("Ajax error!")
            }
        })
    }

    render() {
        return (<button style={this.state.is_hidden}
                        className='input massive ui primary basic button'
                        onClick={this.handleClick}
                        id={this.props.btn_id}>
            <span><strong>{this.props.category}</strong></span>
        </button>);
    }
}