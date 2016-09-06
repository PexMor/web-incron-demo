xhr = new XMLHttpRequest();

function action(o) {
    xhr.open("GET", "op.php?op="+o.id, true);
    xhr.send();
    return false;
}
