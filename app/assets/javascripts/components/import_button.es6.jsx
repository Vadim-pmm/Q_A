class ImportButton extends React.Component {
    constructor() {
        super();
        this.state = {
            is_hidden: {display: 'none'}
        };
        this.handleClick = this.handleClick.bind(this);
        this.importQuestion = this.importQuestion.bind(this);
    }

    toggleState() {
        if (this.state.is_hidden.display == 'none') {
            this.setState({is_hidden: {display: 'block'}})
        }
        else {
            this.setState({is_hidden: {display: 'none'}})
        }
    }

    importQuestion(e) {
        e.preventDefault();
        let tempThis = this;
        let str = '';

        let data_ = new FormData();
        data_.append('file', document.getElementById('file').files[0]);

        $.post({
            url: '/import',
            data: data_,
            contentType: false,
            processData: false,
            success: function() {
                tempThis.toggleState();
            },
            error: function() {
                tempThis.toggleState();
            }
        });
    }

    handleClick(e) {
        e.preventDefault();
        this.toggleState();
    }

    render() {
        return (<div>
                    <button id='importButton' className='ui primary basic button' onClick={this.handleClick}>
                        <span><strong>Import</strong></span>
                    </button>

                    <div style={this.state.is_hidden}>
                        <form className='form-inline' onSubmit={this.importQuestion}>
                            <input id='file' type='file' accept='.json' className='form-control my-margin'/>
                            <button type="submit" className='mini ui secondary basic button'>Get</button>
                        </form>
                    </div>

                </div>
        );
    }
}
