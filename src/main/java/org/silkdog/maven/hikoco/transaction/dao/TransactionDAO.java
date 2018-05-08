package org.silkdog.maven.hikoco.transaction.dao;

import org.silkdog.maven.hikoco.transaction.dto.TransactionDTO;

public interface TransactionDAO {
    TransactionDTO selectOne();
}
