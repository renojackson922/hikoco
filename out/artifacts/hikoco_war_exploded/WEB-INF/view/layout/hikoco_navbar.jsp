    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="/main.do">Cafe HIKOCO</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
    <li class="nav-item active">
    <a class="nav-link" href="/main.do">Home <span class="sr-only">(current)</span></a>
    </li>
    <li class="nav-item">
    <a class="nav-link" href="/item.do"><i class="fas fa-gift"></i>&nbsp;Item</a>
    </li>
    <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Dropdown
    </a>
    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
    <a class="dropdown-item" href="#">Action</a>
    <a class="dropdown-item" href="#">Another action</a>
    <div class="dropdown-divider"></div>
    <a class="dropdown-item" href="#">Something else here</a>
    </div>
    </li>
    <li class="nav-item">
    <a class="nav-link disabled" href="#">Disabled</a>
    </li>
    </ul>
        <!-- Another nav -->
        <ul class="navbar-nav mr-2">
        <li class="nav-item">
        <a class="nav-link" href="#">Sign in</a>
        </li>
        <li class="nav-item">
        <a class="nav-link" href="#">My Cart</a>
        </li>
        </ul>
    <form class="form-inline my-2 my-lg-0">
    <input class="form-control mr-sm-2" type="search" placeholder="상품명 검색" aria-label="Search">
    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
    </form>
    </div>
    </nav>
