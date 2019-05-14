package com.noisyle.crypto.mybatis.handler;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.apache.ibatis.type.DoubleTypeHandler;
import org.apache.ibatis.type.JdbcType;
import org.apache.ibatis.type.MappedJdbcTypes;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import com.noisyle.crypto.util.DESTool;


@MappedJdbcTypes({JdbcType.VARCHAR})
public class CryptoDoubleTypeHandler extends DoubleTypeHandler {

    private Logger logger = LoggerFactory.getLogger(getClass());

    @Override
    public void setNonNullParameter(PreparedStatement ps, int i, Double parameter, JdbcType jdbcType)
            throws SQLException {
        try {
            String str = DESTool.encrypt(String.valueOf(parameter));
            ps.setString(i, str);
        } catch (Exception e) {
            logger.error("parameter: {}", parameter, e);
        }
    }

    @Override
    public Double getNullableResult(ResultSet rs, String columnName) throws SQLException {
        String str = rs.getString(columnName);
        if(StringUtils.hasLength(str)) {
            try {
                return Double.valueOf(DESTool.decrypt(str));
            } catch (Exception e) {
                logger.error("{}: {}", columnName, rs.getString(columnName), e);
            }
        }
        return null;
    }

    @Override
    public Double getNullableResult(ResultSet rs, int columnIndex) throws SQLException {
        String str = rs.getString(columnIndex);
        if(StringUtils.hasLength(str)) {
            try {
                return Double.valueOf(DESTool.decrypt(str));
            } catch (Exception e) {
                logger.error("{}: {}", columnIndex, rs.getString(columnIndex), e);
            }
        }
        return null;
    }

    @Override
    public Double getNullableResult(CallableStatement cs, int columnIndex) throws SQLException {
        String str = cs.getString(columnIndex);
        if(StringUtils.hasLength(str)) {
            try {
                return Double.valueOf(DESTool.decrypt(str));
            } catch (Exception e) {
                logger.error("{}: {}", columnIndex, cs.getString(columnIndex), e);
            }
        }
        return null;
    }

}
