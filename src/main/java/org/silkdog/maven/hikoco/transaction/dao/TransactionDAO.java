package org.silkdog.maven.hikoco.transaction.dao;

import org.silkdog.maven.hikoco.transaction.vo.TransactionVO;

public interface TransactionDAO {
    TransactionVO selectOne();
}
