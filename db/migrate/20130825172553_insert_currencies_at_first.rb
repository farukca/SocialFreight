class InsertCurrenciesAtFirst < ActiveRecord::Migration
  def up
      execute "DELETE FROM NIMBOS_CURRENCIES;
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('TRY','TURK LIRASI','',1,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('USD','US DOLLAR','',1,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('EUR','EURO','',1,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('GBP','POUND STERLING','',1,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('CAD','CANADIAN DOLLAR','',1,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('XDR','SPECIAL D.RIGHT','',1,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('DKK','DANISH KRONE','',1,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('SEK','SWEDISH KRONA','',1,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('CHF','SWISS FRANK','',1,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('NOK','NORWEGIAN KRONE','',1,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('JPY','YEN','',100,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('SAR','SAUDI RIYAL','',1,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('KWD','KUWAITI DINAR','',1,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('AUD','AUSTRALIAN DOLL','',1,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('RUB','RUSSIAN ROUBLE','',1,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('RON','NEW LEU','',1,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('IRR','RIAL','',100,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('BGN','BULGARIAN LEV','',1,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('DEM','DEUTSCHE MARK','',1,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('BEF','BELGIQUE FRANG','',1,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('LUF','LETZEBUERG FRANG','',1,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('ESP','ESPANA PESETAS','',1,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('IEP','IRELAND LIRAS','',1,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('FRF','FRANCE FRANG','',1,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('ITL','ITALIA LIRE','',1,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('NLG','NEDERLAND FLORIN','',1,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('PTE','PORTUGAL ESKUDO','',1,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('FIM','FIN MARKKA','',1,now(),now());
                       INSERT INTO NIMBOS_CURRENCIES (code,name,symbol,multiplier,created_at,updated_at) VALUES ('GRD','GREECE DRAHMI','',1,now(),now());
                      "
  end

  def down
        execute "DELETE FROM NIMBOS_CURRENCIES;"
  end
end
